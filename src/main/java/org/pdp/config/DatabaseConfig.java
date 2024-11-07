package org.pdp.config;

import java.sql.Connection;

public interface DatabaseConfig {
    Connection connect();
}
