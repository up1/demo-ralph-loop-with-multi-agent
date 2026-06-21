#!/bin/bash

echo "Starting..."

# 1. Plan with agy cli to create TASK.json
agy -p "/plan Read requirement from file REQ.md and write plan to file TASK.json"

while true; do
  # Check if the overall completion token has been written to the console output
  # We pipe PROMPT.md straight into Claude Code to start a clean session
  OUTPUT=$(cat PROMPT.md | claude -p)

  # Check if Claude declared the entire PRD complete
  if [[ "$OUTPUT" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "Success! All planned tasks are complete."
    break
  fi

  # Show with task id and task description
  echo "Claude Output: $OUTPUT"
  echo "Task iteration completed. Wiping context and pivoting to next step..."
  sleep 2
done

echo "Finished."
