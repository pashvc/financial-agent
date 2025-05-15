# Coolify Deployment Guide

This guide will help you deploy the Financial Agent application on Coolify.

## Prerequisites

- Coolify instance up and running
- Git repository with the Financial Agent code
- OpenAI API key
- Polygon API key

## Deployment Steps

1. In Coolify, create a new project or use an existing one.

2. Add a new service and select "Docker" as the deployment method.

3. Connect your Git repository.

4. Configure the following settings:

   - **Build Pack**: Dockerfile
   - **Base Directory**: / (root of the repository)
   - **Port Expose**: 8000
   - **Port Mappings**: 8000:8000

5. Add the following environment variables:

   - `OPENAI_API_KEY`: Your OpenAI API key
   - `POLYGON_API_KEY`: Your Polygon API key

6. Configure the Docker Registry settings if you're using a private registry.

7. For the Docker Build Stage Target, leave it blank to use the default target.

8. Set the healthcheck endpoints:

   - Path: `/health`
   - Interval: 30s
   - Timeout: 10s
   - Retries: 5

9. Click "Deploy" to start the deployment process.

## Troubleshooting

If you encounter issues with the deployment:

1. Check the logs for errors related to missing environment variables.
2. Ensure the port mappings are correctly set to 8000:8000.
3. Verify that your API keys are valid and correctly set in the environment variables.
4. Make sure the healthcheck is correctly configured and the `/health` endpoint is responding.

## Accessing the Application

Once deployed, your application will be available at:

`https://your-coolify-domain/agent/playground`

You can also check the health of your application at:

`https://your-coolify-domain/health`
