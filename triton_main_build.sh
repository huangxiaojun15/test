#!/bin/bash

set -e

function parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
        --build_ops)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                build_ops="$2"
                shift 2
            else
                log_info "Error: Argument required after build_ops, like --build_ops prebuild or codebuild."
                exit 1
            fi
            ;;
        --npuir_folder)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                npuir_folder="$2"
                shift 2
            else
                log_info "Error: Argument required after npuir_folder, like --npuir_folder 20260801165300."
                exit 1
            fi
            ;;
        --architecture)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                architecture="$2"
                shift 2
            else
                log_info "Error: Argument required after architecture, like --architecture aarch64."
                exit 1
            fi
            ;;
        --job_name)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                job_name="$2"
                shift 2
            else
                log_info "Error: Argument required after job_name, like --job_name arm-python313-main."
                exit 1
            fi
            ;;
        --llvm_name)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                llvm_name="$2"
                shift 2
            else
                log_info "Error: Argument required after llvm_name, like --llvm_name arm-python313-main."
                exit 1
            fi
            ;;
        --python_version)
            if [[ $# -gt 1 && "$2" != "-"* ]]; then
                python_version="$2"
                shift 2
            else
                log_info "Error: Argument required after python_version, like --python_version cp313-cp313."
                exit 1
            fi
            ;;
        *)
            shift
            ;;
        esac
    done
}
cd $WORKSPACE/
parse_args "$@"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
source ${SCRIPT_DIR}/triton_common.sh

folder="${jobName: -14}"

if [ "${build_ops}" == "prebuild" ];then
    search_npuir_newest "${npuir_component_name}" "${npuir_version}" "${npuir_offering}"
    set_proxy
    retry_func git_clone_triton_ascend "${triton_ascend_repo}" "${triton_ascend_branch}"
    unset_proxy
    artget_push "${offering_name}" "${component_name}" "${component_version}" "triton-ascend_code.tar.gz" "${folder}" "Inner"
elif [ "${build_ops}" == "codebuild" ];then
    artget_pull "${npuir_offering}" "${npuir_component_name}" "${npuir_version}" "${npuir_folder}" "./npuir_pkg" "Software"
    artget_pull "${offering_name}" "${component_name}" "${component_version}" "${folder}/triton-ascend_code.tar.gz" "./" "Inner"
    conf_triton_ascend_code "$WORKSPACE/npuir_pkg" "$WORKSPACE/" "${architecture}"
    conf_remote_ccache "${job_name}"
    set_proxy
    if [ "${triton_ascend_branch}" == "release/3.2.2" ];then
        cd triton-ascend/python
        triton_build "${llvm_name}" "${python_version}"
    else
        cd triton-ascend
        triton_build "${llvm_name}" "${python_version}" "${folder}"
    fi
    mkdir -p $WORKSPACE/triton_pkg
    cp -u dist/*.whl $WORKSPACE/triton_pkg
    unset_proxy
    artget_push "${offering_name}" "${component_name}" "${component_version}" "./triton_pkg" "${folder}" "Software"
fi
