#!/bin/bash

while getopts abc OPTION
do
  case ${OPTION} in
    a)
      echo 'eu sou a'
      ;;
    b)
      echo 'eu sou b'
      ;;
    c)
      echo 'eu sou c'
      ;;
  esac
done	

echo "todos argumentos: ${@}"
echo "numero de arhumentos: ${#}"
echo "primeiro: ${1}"
echo "segundo: ${2}"
echo "terceiro: ${3}"
echo "OPTIND: ${OPTIND}"

echo "primeira posicao apos options: $(( OPTIND - 1 ))"
