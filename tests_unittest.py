import unittest
import tests_lib

class TestStringMethods(unittest.TestCase):

    def test_Ping_VPP_interface1(self):
        self.assertEqual(tests_lib.ping("10.10.1.100"), True)

    def test_Ping_VPP_interface2(self):
        self.assertEqual(tests_lib.ping("10.10.2.100"), True)

    def test_sfr_35Gb_traffic(self):
        self.assertEqual(tests_lib.sfr_35Gb_traffic("logs/sfr_35Gb_traffic.txt"), True)
    
    def test_imix_1G_1600_flows(self):
        self.assertEqual(tests_lib.imix_1G_1600_flows("logs/imix_1G_1600_flows.txt"), True)
    
if __name__ == '__main__':
    unittest.main()