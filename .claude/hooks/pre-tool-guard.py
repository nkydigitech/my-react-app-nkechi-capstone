#!/usr/bin/env python3
"""
Hook: pre-tool-guard (PreToolUse)
Prevents destructive operations from executing without confirmation.
"""
import sys
import json
import re

DANGEROUS_PATTERNS = [
    r'terraform\s+destroy',
    r'rm\s+-rf\s+/',
    r'rm\s+-rf\s+\*',
    r'aws\s+s3\s+rb',              # Remove bucket
    r'aws\s+s3\s+rm.*--recursive',  # Recursive S3 delete
    r'aws\s+cloudfront\s+delete-distribution',
]

def main():
    input_data = json.loads(sys.stdin.read())
    tool_name = input_data.get("tool_name", "")
    tool_input = json.dumps(input_data.get("tool_input", {}))

    # Only check bash/shell tool executions
    if tool_name not in ["bash", "shell", "terminal"]:
        output = {"decision": "allow"}
        print(json.dumps(output))
        return

    command = input_data.get("tool_input", {}).get("command", "")

    for pattern in DANGEROUS_PATTERNS:
        if re.search(pattern, command, re.IGNORECASE):
            output = {
                "decision": "block",
                "message": f"🛑 Blocked destructive operation: `{command[:80]}...`\nThis command could delete infrastructure or data. Please confirm you want to proceed by rephrasing with explicit intent."
            }
            print(json.dumps(output))
            return

    output = {"decision": "allow"}
    print(json.dumps(output))

if __name__ == "__main__":
    main()
