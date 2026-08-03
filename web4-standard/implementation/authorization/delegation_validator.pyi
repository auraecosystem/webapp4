from datetime import datetime


class DelegationValidator:

    def validate(self, delegation):

        required = [
            "delegator",
            "delegate",
            "permission",
            "expires_at",
            "signature"
        ]

        for field in required:

            if field not in delegation:
                return False

        if delegation["expires_at"] < datetime.utcnow():
            return False

        return self.verify_signature(
            delegation["signature"]
        )

    def verify_signature(self, signature):

        return bool(signature)
