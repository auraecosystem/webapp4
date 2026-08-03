CREATE TABLE atp_accounts (
    account_id INTEGER PRIMARY KEY,
    balance REAL NOT NULL DEFAULT 0,
    reserved_balance REAL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE atp_transactions (
    tx_id TEXT PRIMARY KEY,
    account_id INTEGER,
    amount REAL,
    tx_type TEXT,
    status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES atp_accounts(account_id)
);

CREATE TABLE withdrawal_limits (
    account_id INTEGER PRIMARY KEY,
    daily_limit REAL,
    hourly_limit REAL,
    last_reset TIMESTAMP,
    FOREIGN KEY(account_id) REFERENCES atp_accounts(account_id)
);

CREATE TABLE suspicious_activity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER,
    reason TEXT,
    risk_score REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
