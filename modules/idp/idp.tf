
resource "aws_cognito_user_pool_domain" "domain" {
  domain          = var.amazoncognito_name
  user_pool_id    = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.app_name}-pool"
  alias_attributes           = ["email"]
  auto_verified_attributes   = ["email"]

  verification_message_template{
    default_email_option="CONFIRM_WITH_LINK"
    email_subject_by_link="Ankan Verification link"
    email_message_by_link ="Please click the link below to verify your email address. {##Verify Email##} "
  }

  password_policy {
    minimum_length = 6
    require_numbers = true
    require_lowercase = false
    require_symbols = false
    require_uppercase = false
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name = "${var.app_name}-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  refresh_token_validity = 30
#  read_attributes  = ["nickname"]
#  write_attributes = ["nickname"]

  # APP INTEGRATION -
  # APP CLIENT SETTINGS
  supported_identity_providers = ["COGNITO"]
  callback_urls                = ["http://localhost:4200"]
  logout_urls                  = ["http://localhost:4200"]
}

resource "aws_cognito_identity_pool" "main" {
  identity_pool_name = var.identity_pool_name
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.client.id
    provider_name = aws_cognito_user_pool.user_pool.endpoint
    server_side_token_check = false
  }

}
data "aws_iam_policy_document" "auth_iam_role_policy" {
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "sts:AssumeRoleWithWebIdentity"]
    principals {
      identifiers = [
        "cognito-identity.amazonaws.com"]
      type = "Federated"
    }
  }
}
data "aws_iam_policy_document" "unauth_iam_role_policy" {
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "sts:AssumeRoleWithWebIdentity"]
    principals {
      identifiers = [
        "cognito-identity.amazonaws.com"]
      type = "Federated"
    }
  }
}

data "aws_iam_policy_document" "unauth_web_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/public/*"
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/protected/*"
    ]
    effect = "Allow"
  }

  statement {
    condition {
      test = "StringLike"
      values = [
        "public/",
        "public/*",
        "protected/",
        "protected/*"]
      variable = "s3:prefix"
    }
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}"
    ]
    effect = "Allow"

  }

}

data "aws_iam_policy_document" "auth_web_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/public/*",
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/protected/&{cognito-identity.amazonaws.com:sub}/*",
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/private/&{cognito-identity.amazonaws.com:sub}/*"
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}/protected/*"
    ]
    effect = "Allow"
  }

  statement {
    condition {
      test = "StringLike"
      values = [
        "public/",
        "public/*",
        "protected/",
        "protected/*",
        "private/&{cognito-identity.amazonaws.com:sub}/",
        "private/&{cognito-identity.amazonaws.com:sub}/*"
      ]
      variable = "s3:prefix"
    }
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.upload_bucket.bucket}"
    ]
    effect = "Allow"

  }

}




resource "aws_cognito_user_group" "main" {
  name = var.name
  user_pool_id = aws_cognito_user_pool.user_pool.id
  description = var.description
  precedence = var.precedence
  role_arn = aws_iam_role.auth_iam_role.arn

}




resource "aws_iam_role" "auth_iam_role" {
  name = "cognito_auth_iam_role_${var.app_name}"
  assume_role_policy = data.aws_iam_policy_document.auth_iam_role_policy.json
}

resource "aws_iam_role" "unauth_iam_role" {
  name = "cognito_unauth_iam_role_${var.app_name}"
  assume_role_policy = data.aws_iam_policy_document.unauth_iam_role_policy.json
}

resource "aws_iam_role_policy" "web_iam_unauth_role_policy" {
  name = "web_iam_unauth_role_policy_${var.app_name}"
  role = aws_iam_role.unauth_iam_role.id
  policy = data.aws_iam_policy_document.unauth_web_policy.json
}

resource "aws_iam_role_policy" "web_iam_auth_role_policy" {
  name = "web_iam_auth_role_policy_${var.app_name}"
  role = aws_iam_role.auth_iam_role.id
  policy = data.aws_iam_policy_document.auth_web_policy.json
}



resource "aws_cognito_identity_pool_roles_attachment" "main" {
  identity_pool_id = aws_cognito_identity_pool.main.id

  roles = {
    authenticated = aws_iam_role.auth_iam_role.arn
    unauthenticated = aws_iam_role.unauth_iam_role.arn
  }
}
