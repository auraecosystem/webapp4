# Install the primitives with either toolchain:

pip install web4-core web4-trust
cargo add web4-core web4-trust-core
# Simulate a 503 SlowDown response
curl https://s3.us.archive.org -v -H "x-archive-simulate-error:SlowDown"

# List all supported errors for testing
curl https://s3.us.archive.org -v -H "x-archive-simulate-error:help"
curl --location "http://archive.org/download/$bucket/$key"

cd simulations

# Attack simulations
python attack_simulations.py               # Core attack simulation framework
python attack_track_fb.py                  # Trust manipulation attacks
python attack_track_fc.py                  # Economic attacks

# For full 4-Life game demos, see: https://github.com/dp-web4/4-life
