resource "aws_dynamodb_table" "test_ci_cd" {
    name = "test-ci-cd"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "id"
    attribute {
        name = "id"
        type = "S"
    }
}