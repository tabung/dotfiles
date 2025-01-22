#!/bin/bash

# Nama sesi tmux yang ingin diperiksa
SESSION_NAME="main"

# Periksa apakah sesi tmux sudah ada
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  # Jika sesi belum ada, buat sesi baru
  tmux new-session -s $SESSION_NAME
else
  # Jika sesi sudah ada, masuk ke sesi tersebut
  tmux attach-session -t $SESSION_NAME
fi
