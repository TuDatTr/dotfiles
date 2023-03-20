#!/usr/bin/env nu

let zellij_session_table = (zellij ls | lines);
let zellij_session_count = ($zellij_session_table | length);

if $zellij_session_count == 0 {
  zellij
} else if $zellij_session_count == 1 {
  zellij attach
} else {
    let prompt = $" zellij sessions:

($zellij_session_table|table)

  Choose session 0-($zellij_session_count - 1): ";

  let user_input = (input $"($prompt)");

  try {
    "Into Try"
    let user_input = ($user_input | into int);
    "Converted"
    $"User Input: ($user_input)";
    $"Threshold: 0-($zellij_session_count - 0)";
    $"UserInput in Threshold? (0 < $user_input or $user_input < $zellij_session_count - 1)"
    if (0 < $user_input or $user_input < $zellij_session_count - 1) {
      "Valid Input"
      let table_entry = ($zellij_session_table | select $user_input);
      zellij attach $table_entry;
    } else {
      "Invalid Input"
      zellij;
    }  
  } catch {
    "Catch"
    zellij;
  }
}
