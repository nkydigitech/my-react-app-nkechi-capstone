#!/usr/bin/env python3
"""
Hook: user-prompt-guard (UserPromptSubmit)
Guards against accidentally pasting AWS secrets into prompts.
"""
import sys
import json
import re

def main():
    input_data = json.loads(sys.stdin.read())
    prompt = input_data.get("prompt", "")

    # Patterns that indicate AWS secrets
    patterns = [
        r'AKIA[0-9A-Z]{16}',           # AWS Access Key ID
        r'[0-9a-zA-Z/+]{40}',          # Potential AWS Secret Key (40 chars base64)
        r'aws_secret_access_key\s*=',   # Terraform/config secret key assignment
        r'aws_access_key_id\s*=',       # Terraform/config access key assignment
    ]

    for pattern in patterns:
        if re.search(pattern, prompt):
            # Block the prompt
            output = {
                "decision": "block",
                "message": "⚠️ Blocked: Your prompt appears to contain AWS credentials. Never paste secrets into the chat. Use environment variables or AWS profiles instead."
            }
            print(json.dumps(output))
            return

    # Allow the prompt
    output = {"decision": "allow"}
    print(json.dumps(output))

if __name__ == "__main__":
    main()
