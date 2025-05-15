FROM python:3.12-bullseye

RUN pip install poetry==1.6.1

WORKDIR /code

COPY pyproject.toml poetry.lock* /code/

# Install dependencies first for better caching
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY . /code/

# Set environment variables
ENV PYTHONPATH=/code
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

# Change the command to use uvicorn directly instead of langchain serve
CMD ["poetry", "run", "python", "-m", "uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "8000"]