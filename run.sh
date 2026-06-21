#!/bin/bash

echo "Starting..."

# 1. Plan with agy cli to create TASK.json
echo "1. Planning with agy..."
agy -p "/plan Read requirement from file REQ.md and write plan to file TASK.json with the following format:
{
  "tasks": [
    {
      "id": 1,
      "description": "Task description here",
      "completed": false
    },
    ...
  ]
}"
echo "Planning completed. TASK.json created."

# 2. Execute with claude code, using TASK.json as input
echo "2. Executing with Claude Code..."
while true; do
  # Check if the overall completion token has been written to the console output
  # We pipe PROMPT.md straight into Claude Code to start a clean session
  OUTPUT=$(cat PROMPT.md | claude -p --dangerously-skip-permissions)

  # Check if Claude declared the entire TASK complete all ?
    if echo "$OUTPUT" | grep -q '"completed": true'; then
        echo "All tasks marked as completed by Claude. Exiting loop."
        break
    fi

  # Show with task id and task description
  echo "Claude Output: $OUTPUT"
  echo "Task iteration completed. Wiping context and pivoting to next step..."
  sleep 2
done

echo "All tasks completed. Exiting."
