
resource "aws_s3_bucket_object" "frontend_object" {
  provider = aws.main
  depends_on = [aws_s3_bucket.main]
  for_each = fileset("${var.source_folder}/", "**/*")
  key    = each.value
  source =  "${var.source_folder}/${each.value}"
  bucket = aws_s3_bucket.main.bucket
  etag         = filemd5("${var.source_folder}/${each.value}")
  content_type = lookup(local.mime_type_mappings, concat(regexall("\\.([^\\.]*)$", each.value), [[""]])[0][0], "application/octet-stream")
}



resource "aws_s3_bucket_object" "config_json_file" {
  provider = aws.main
  depends_on = [aws_s3_bucket_object.frontend_object]
  bucket = aws_s3_bucket.main.bucket
  key = var.build_config_path
  content_type = "text/json"
  content  = data.template_file.template.rendered
}
