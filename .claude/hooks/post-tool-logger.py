#!/usr/bin/env python3
"""
Hook: post-tool-logger (PostToolUse)
Logs all tool executions for audit trail.
"""
import sys
import json
import os
from datetime import datetime

LOG_DIR = ".claude/logs"
LOG_FILE = os.path.join(LOG_DIR, "tool-usage.log")

def main():
    input_data = json.loads(sys.stdin.read())
    
    tool_name = input_data.get("tool_name", "unknown")
    tool_input = input_data.get("tool_input", {})
    exit_code = input_data.get("exit_code", "N/A")
    
    # Ensure log directory exists
    os.makedirs(LOG_DIR, exist_ok=True)
    
    # Build log entry
    timestamp = datetime.now().isoformat()
    command = tool_input.get("command", tool_input.get("content", ""))[:200]
    
    log_entry = f"[{timestamp}] tool={tool_name} | exit={exit_code} | cmd={command}\n"
    
    # Append to log file
    with open(LOG_FILE, "a") as f:
        f.write(log_entry)
    
    # Always allow (this is post-execution logging)
    output = {"decision": "allow"}
    print(json.dumps(output))

if __name__ == "__main__":
    main()
