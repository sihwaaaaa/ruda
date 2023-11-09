# Ruda Project

# Overview

# CLI sample
```bash
# macOS or linux
./gradlew bootRun -Dspring.profiles.active={profiles-name}

# window
./gradlew.bat bootRun -Dspring.profiles.active={profiles-name}

# example
## macOS or linux
./gradlew bootRun -Dspring.profiles.active=local

## window
gradlew.bat bootRun -Dspring.profiles.active=local
```

# vscode launch.json sample
```json
{
    "type": "java",
    "name": "RudaApplication",
    "request": "launch",
    "mainClass": "co.poetrypainting.ruda.RudaApplication",
    "projectName": "ruda","args": "--spring.profiles.active={profile}"  
}
```
