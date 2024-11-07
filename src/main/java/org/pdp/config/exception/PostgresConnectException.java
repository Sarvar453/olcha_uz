package org.pdp.config.exception;

public class PostgresConnectException extends RuntimeException {
    public PostgresConnectException(String message) {
        super(message);
    }
}
