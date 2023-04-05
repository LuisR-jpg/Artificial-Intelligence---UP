import unittest as ut
from armstrong import ArmstrongNumber

class TestArmstrongNumber(ut.TestCase):
    def test_return(self):
        pass
        self.assertTrue(ArmstrongNumber(3))
        self.assertTrue(ArmstrongNumber(153))
        self.assertTrue(ArmstrongNumber(371))

        self.assertFalse(ArmstrongNumber(10))
        self.assertFalse(ArmstrongNumber(-1))
        self.assertFalse(ArmstrongNumber(100))

    def test_invalid(self):
        """
            ArmstrongNumber("Hello!")
        with self.assertRaises(TypeError):
        """
        with self.assertRaises(TypeError):
            ArmstrongNumber(True)
        with self.assertRaises(TypeError):
            ArmstrongNumber("Hello!")
            
if __name__ == '__main__':
    ut.main()