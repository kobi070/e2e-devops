FROM python:3.11-slim as builder

WORKDIR /app

# Copy requirements.txt and install libs
COPY src/requirements.txt .
RUN pip install -r requirements.txt

# 2nd Stage using the builder stage
FROM python:3.11-slim

WORKDIR /app

# Copy from our builder the libs we installed
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

COPY /src .

EXPOSE 5001

CMD [ "python", "app.py" ]
