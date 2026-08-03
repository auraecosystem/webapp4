from dataclasses import dataclass

@dataclass
class User:
    id: int
    permissions: set


class AuthorizationEngine:

    def authorize(self, user: User, permission: str):

        if permission in user.permissions:
            return True

        raise PermissionError(
            f"Permission '{permission}' denied."
        )

    def require(self, user, permission):

        self.authorize(user, permission)
        return True
