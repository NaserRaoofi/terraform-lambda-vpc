#!/bin/bash
echo "Packaging Lambda function..."
zip -r lambda_function.zip lambda_function.js
echo "Lambda function packaged successfully!"
