#include "gtest/gtest.h"


double square_root (const double)
{
	return 0.0;
}

TEST(SquareRootTest, PositiveNos) {
    EXPECT_EQ (18.0, square_root (324.0));
}

int main(int argc, char **argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}
