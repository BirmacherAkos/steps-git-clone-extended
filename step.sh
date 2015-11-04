#!/bin/bash

#
# NOTE:
#  the raw-ssh-key parameter is a multiline input -> will be directly retrieved from the environment
#

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

formatted_output_file_path=''
if [ -n "${BITRISE_STEP_FORMATTED_OUTPUT_FILE_PATH}" ] ; then
	formatted_output_file_path="${BITRISE_STEP_FORMATTED_OUTPUT_FILE_PATH}"
fi

is_export_outputs='false'
if [[ "${is_expose_outputs}" == "true" ]] ; then
	is_export_outputs='true'
fi

ruby "${THIS_SCRIPT_DIR}/git_clone.rb" \
	--repo-url="${repository_url}" \
	--commit-hash="${commit}" \
	--tag="${tag}" \
	--branch="${branch}" \
	--pull-request="${pull_request_id}" \
	--dest-dir="${clone_into_dir}" \
	--auth-username="${auth_user}" \
	--auth-password="${auth_password}" \
	--formatted-output-file="${formatted_output_file_path}" \
	--is-export-outputs="${is_export_outputs}"
exit $?
