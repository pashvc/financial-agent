FROM python:3.12-bullseye

RUN pip install poetry==1.6.1

WORKDIR /code

# Copy essential files first
COPY app /code/app/
COPY README.md /code/
COPY pyproject.toml poetry.lock* /code/

# Install dependencies 
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Then copy the rest of the files
COPY . /code/

# Set environment variables
ENV PYTHONPATH=/code
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

# Change the command to use uvicorn directly instead of langchain serve
CMD ["poetry", "run", "python", "-m", "uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "8000"]