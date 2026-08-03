use web4_core::{
    Lct,
    EntityType,
    T3,
    TrustDimension,
    Coherence,
    InMemoryLedger,
    Ledger,
};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // ==========================================================
    // WEB4 CORE IDENTITY LIFECYCLE
    // ==========================================================

    // Create a Living Cognitive Token (LCT)
    let (lct, keypair) = Lct::new(EntityType::Human, None);

    // Register the identity on the ledger
    let mut ledger = InMemoryLedger::new();
    let receipt = lct.mint(&mut ledger)?;

    println!("Identity  : {}", lct.id);
    println!("Ledger ID : {}", receipt.entry_index);
    println!("Hash      : {}", receipt.entry_hash);

    // ----------------------------------------------------------
    // Cryptographic Authentication
    // ----------------------------------------------------------

    let message = b"Hello, Web4!";

    let signature = keypair.sign(message);

    lct.verify_signature(message, &signature)?;

    println!("✓ Signature verified");

    // ----------------------------------------------------------
    // Immutable Proof of Existence
    // ----------------------------------------------------------

    let proof = ledger.anchor(lct.id)?;

    ledger.verify_proof(&proof)?;

    println!("✓ Ledger proof verified");

    // ----------------------------------------------------------
    // Trust Tensor (T³)
    // ----------------------------------------------------------

    let mut trust = T3::new();

    trust.observe(TrustDimension::Talent, 0.90)?;
    trust.observe(TrustDimension::Training, 0.85)?;
    trust.observe(TrustDimension::Truthfulness, 0.94)?;
    trust.observe(TrustDimension::Transparency, 0.91)?;

    let trust_score = trust.aggregate();

    println!("Trust Score = {:.3}", trust_score);

    // ----------------------------------------------------------
    // Identity Coherence
    // ----------------------------------------------------------

    let coherence =
        Coherence::with_values(
            0.92,
            0.92,
            0.92,
            0.92,
        )?;

    assert!(
        coherence.meets_threshold(
            lct.coherence_threshold()
        )
    );

    println!("✓ Identity coherence validated");

    println!("\nWEB4 Identity Successfully Validated");

    Ok(())
}
