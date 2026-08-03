import unittest

from authorization_engine import (
    AuthorizationEngine,
    User
)


class TestSecurity(unittest.TestCase):

    def setUp(self):

        self.engine = AuthorizationEngine()

    def test_valid_permission(self):

        user = User(
            id=1,
            permissions={"read"}
        )

        self.assertTrue(
            self.engine.authorize(
                user,
                "read"
            )
        )

    def test_invalid_permission(self):

        user = User(
            id=2,
            permissions={"read"}
        )

        with self.assertRaises(
            PermissionError
        ):
            self.engine.authorize(
                user,
                "delete"
            )


if __name__ == "__main__":
    unittest.main()
