# Ruda Project

# Overview

# Run & Debug
## CLI
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

## vscode
```json
// sample launch.json
{
    "type": "java",
    "name": "RudaApplication",
    "request": "launch",
    "mainClass": "co.poetrypainting.ruda.RudaApplication",
    "projectName": "ruda","args": "--spring.profiles.active={profile}"  
    // profile <-- application-{profile}.yaml or application-{profile}.properties
 }
```
