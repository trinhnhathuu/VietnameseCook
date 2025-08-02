#!/bin/bash
echo "Generating code..."
dart run build_runner build --delete-conflicting-outputs
echo "Code generation completed!" 