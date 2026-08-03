from collections import Counter


class SybilResistance:

    def detect(self, identities):

        fingerprints = [
            x["fingerprint"]
            for x in identities
        ]

        counts = Counter(fingerprints)

        suspicious = []

        for fp, n in counts.items():

            if n > 3:
                suspicious.append(
                    {
                        "fingerprint": fp,
                        "count": n,
                        "risk": "HIGH"
                    }
                )

        return suspicious

    def reputation_weight(self, age_days):

        if age_days < 30:
            return 0.3

        if age_days < 180:
            return 0.7

        return 1.0
