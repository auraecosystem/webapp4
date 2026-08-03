aurapaper/
├── sections/           # One DIRECTORY per section, content in index.md
│   ├── 01-title-authors/index.md              # Title page
│   ├── 02-why-web4/index.md                   # The stakes (why)
│   ├── 03-the-equation/index.md               # Web4 = MCP + RDF + LCT + T3/V3*MRH + ATP/ADP
│   ├── 04-mcp/index.md                        # Equation element 1: the I/O membrane
│   ├── 05-rdf/index.md                        # Element 2: the ontological backbone
│   ├── 06-lct/index.md                        # Element 3: the presence substrate
│   ├── 07-t3v3/index.md                       # Element 4: trust & value tensors
│   ├── 08-mrh/index.md                        # Element 5: the relevancy horizon
│   ├── 09-atp-adp/index.md                    # Element 6: the value-feedback cycle
│   ├── 10-composed-architecture/index.md      # R6/R7, roles, societies/SAL/AGY/ACP, dictionaries
│   ├── 11-standard-and-implementations/index.md  # web4-standard + hub + hestia repo links
│   ├── 12-conclusion/index.md                 # Wrap-up, legal, invitation
│   ├── 13-glossary/index.md                   # Compact reference glossary
│   └── 14-references/index.md
│   # reading order is defined by the add_section calls in make-md.sh, not by dir names
│   # pre-2026-07-09 sections archived at archive/sections-2026-07-09-pre-rewrite/
├── build/             # Generated output (git-ignored)
│   ├── WEB4_Whitepaper_Complete.md
│   ├── WEB4_Whitepaper.pdf
│   └── web/
├── make-md.sh         # Combine sections into monolithic markdown
├── make-pdf.sh        # Generate PDF version
└── make-web.sh        # Generate web version for metalinxx.io
