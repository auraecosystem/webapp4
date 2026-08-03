CREATE TABLE reputation_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    source_user INTEGER,
    score REAL,
    event_type TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE identity_clusters (
    cluster_id INTEGER,
    user_id INTEGER,
    confidence REAL,
    PRIMARY KEY(cluster_id, user_id)
);

CREATE TABLE reputation_flags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    reason TEXT,
    confidence REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_rep_user
ON reputation_events(user_id);

CREATE INDEX idx_cluster
ON identity_clusters(cluster_id);
