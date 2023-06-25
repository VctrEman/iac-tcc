output "s3" {
	value = "${aws_s3_bucket.bucket1.bucket}"

}

output "app_server" {
	value = "${aws_instance.app_server[0].public_dns}"
}
