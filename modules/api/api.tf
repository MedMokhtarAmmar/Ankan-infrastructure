############################################
# API GATEWAY - Sets up & configure api gw
############################################
data "template_file" "template" {
  template = file(var.swagger_file_path)
  vars = var.api_template_vars
}

############################################
# API GATEWAY - Sets up & configure api gw
############################################

resource "aws_api_gateway_rest_api" "api_gw" {
  name        = "${var.app_name}-api"
  description = "${var.app_name} : API GW"
  body = data.template_file.template.rendered

}

resource "aws_api_gateway_usage_plan" "apigw_usage_plan" {
  name         = "${var.app_name}-usage-plan"
  description  = "${var.app_name} : Usage Plan for API GW"
  product_code = "MYCODE"

  api_stages {
    api_id = aws_api_gateway_rest_api.api_gw.id
    stage  = aws_api_gateway_stage.stage.stage_name
  }


  quota_settings {
    limit  = 20
    offset = 2
    period = "WEEK"
  }

  throttle_settings {
    burst_limit = 5
    rate_limit  = 10
  }
}
