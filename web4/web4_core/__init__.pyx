import web4_core

# ==========================================================
# COMPLETE WEB4 IDENTITY ENGINE
# ==========================================================

# 1. Create Identity
lct, keypair = web4_core.PyLct.new(
    web4_core.PyEntityType.Human,
    None,
)

# 2. Ledger
ledger = web4_core.PyInMemoryLedger()
receipt = ledger.mint(lct)

# 3. Authentication
message = b"hello, web4"

signature = keypair.sign(message)

assert lct.verify_signature(message, signature)

# 4. Proof of Existence
proof = ledger.anchor(lct.id)

assert ledger.verify_proof(proof)

# 5. Trust Tensor
trust = web4_core.PyT3()

trust.observe(
    web4_core.PyTrustDimension.Talent,
    0.90,
)

trust.observe(
    web4_core.PyTrustDimension.Training,
    0.85,
)

trust.observe(
    web4_core.PyTrustDimension.Transparency,
    0.91,
)

trust.observe(
    web4_core.PyTrustDimension.Truthfulness,
    0.94,
)

trust_score = trust.aggregate()

# 6. Identity Coherence
coherence = web4_core.PyCoherence.with_values(
    0.92,
    0.92,
    0.92,
    0.92,
)

assert coherence.meets_threshold(
    lct.coherence_threshold()
)

print("=" * 50)
print("WEB4 CORE")
print("=" * 50)
print("Identity:", lct.id)
print("Ledger Entry:", receipt.entry_index)
print("Trust Score:", trust_score)
print("Status: VERIFIED")
