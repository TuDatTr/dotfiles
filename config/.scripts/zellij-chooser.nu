#!/usr/bin/env nu

let zellij_session_table = (zellij ls | lines);
let zellij_session_count = ($zellij_session_table | length);

if $zellij_session_count == 0 {
   zellij
} else if $zellij_session_count == 1 {
  zellij attach
} else {
    let prompt = $"
zellij sessions:

($zellij_session_table|table)

Choose session 0-($zellij_session_count - 1):
    ";
    let user_input = (input $"($prompt)"| into int);
    let table_entry = ($zellij_session_table | select $user_input)
    zellij attach $table_entry;
}
