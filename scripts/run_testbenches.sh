#!/usr/bin/env bash
# Compila e roda cada testbench com GHDL. Falha se algum assert de severidade error disparar.
set -u
fail=0
for dir in projetos/*/; do
  tb=$(ls "$dir"*_tb.vhd* 2>/dev/null | head -1)
  [ -z "$tb" ] && continue
  name=$(basename "${tb%.*}")
  work=$(mktemp -d)
  srcs=$(ls "$dir"*.vhd* | grep -v "_tb\.")
  # ordem: arquivos que não instanciam outros primeiro (ALU_* antes de ALU)
  ordered=$(for f in $srcs; do if grep -qi "entity work\." "$f"; then echo "2 $f"; else echo "1 $f"; fi; done | sort | cut -d' ' -f2)
  if ghdl -a --std=08 --workdir="$work" $ordered "$tb" \
     && ghdl -e --std=08 --workdir="$work" "$name" \
     && ghdl -r --std=08 --workdir="$work" "$name" --assert-level=error --stop-time=10ms; then
    echo "PASS $name"
  else
    echo "FAIL $name"; fail=1
  fi
  rm -rf "$work" "$name" e~*.o 2>/dev/null
done
exit $fail
