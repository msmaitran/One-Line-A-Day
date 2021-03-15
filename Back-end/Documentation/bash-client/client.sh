#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for One Line a Day.
#
# LICENSE:
# https://github.com/One-Line-A-Day-11-19/Back-end/blob/master/LICENSE
#
# CONTACT:
# itsmaitran@gmail.com
#
# MORE INFORMATION:
# 
#

# For improved pattern matching in case statemets
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["userLogin:::userLogin"]=1
operation_parameters_minimum_occurrences["addEntryUsingPOST:::newEntry"]=1
operation_parameters_minimum_occurrences["addEntryUsingPOST:::authenticated"]=0
operation_parameters_minimum_occurrences["addEntryUsingPOST:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["addEntryUsingPOST:::credentials"]=0
operation_parameters_minimum_occurrences["addEntryUsingPOST:::details"]=0
operation_parameters_minimum_occurrences["addEntryUsingPOST:::principal"]=0
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::entryid"]=1
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::authenticated"]=0
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::credentials"]=0
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::details"]=0
operation_parameters_minimum_occurrences["deleteEntryByIdUsingDELETE:::principal"]=0
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::entryid"]=1
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::authenticated"]=0
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::credentials"]=0
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::details"]=0
operation_parameters_minimum_occurrences["findEntryByIdUsingGET:::principal"]=0
operation_parameters_minimum_occurrences["getEntriesByUserUsingGET:::authenticated"]=0
operation_parameters_minimum_occurrences["getEntriesByUserUsingGET:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["getEntriesByUserUsingGET:::credentials"]=0
operation_parameters_minimum_occurrences["getEntriesByUserUsingGET:::details"]=0
operation_parameters_minimum_occurrences["getEntriesByUserUsingGET:::principal"]=0
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::entryid"]=1
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::updateEntry"]=1
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::authenticated"]=0
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::credentials"]=0
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::details"]=0
operation_parameters_minimum_occurrences["updateEntryUsingPUT:::principal"]=0
operation_parameters_minimum_occurrences["addNewUserUsingPOST:::newminuser"]=1
operation_parameters_minimum_occurrences["addNewUserUsingPOST:::getaccess"]=0
operation_parameters_minimum_occurrences["addNewRoleUsingPOST:::newRole"]=1
operation_parameters_minimum_occurrences["addNewRoleUsingPUT:::newRole"]=1
operation_parameters_minimum_occurrences["addNewRoleUsingPUT:::roleid"]=1
operation_parameters_minimum_occurrences["deleteRoleByIdUsingDELETE:::id"]=1
operation_parameters_minimum_occurrences["getRoleByIdUsingGET:::roleId"]=1
operation_parameters_minimum_occurrences["getRoleByNameUsingGET:::roleName"]=1
operation_parameters_minimum_occurrences["addNewUserUsingPOST1:::newuser"]=1
operation_parameters_minimum_occurrences["deleteUserByIdUsingDELETE:::id"]=1
operation_parameters_minimum_occurrences["deleteUserRoleByIdsUsingDELETE:::roleid"]=1
operation_parameters_minimum_occurrences["deleteUserRoleByIdsUsingDELETE:::userid"]=1
operation_parameters_minimum_occurrences["getCurrentUserInfoUsingGET:::authenticated"]=0
operation_parameters_minimum_occurrences["getCurrentUserInfoUsingGET:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["getCurrentUserInfoUsingGET:::credentials"]=0
operation_parameters_minimum_occurrences["getCurrentUserInfoUsingGET:::details"]=0
operation_parameters_minimum_occurrences["getCurrentUserInfoUsingGET:::principal"]=0
operation_parameters_minimum_occurrences["getCurrentUserNameUsingGET:::authenticated"]=0
operation_parameters_minimum_occurrences["getCurrentUserNameUsingGET:::authorities[0].authority"]=0
operation_parameters_minimum_occurrences["getCurrentUserNameUsingGET:::credentials"]=0
operation_parameters_minimum_occurrences["getCurrentUserNameUsingGET:::details"]=0
operation_parameters_minimum_occurrences["getCurrentUserNameUsingGET:::principal"]=0
operation_parameters_minimum_occurrences["getUserByIdUsingGET:::userId"]=1
operation_parameters_minimum_occurrences["getUserByNameUsingGET:::userName"]=1
operation_parameters_minimum_occurrences["getUserLikeNameUsingGET:::userName"]=1
operation_parameters_minimum_occurrences["getUserLikeNameUsingGET:::page"]=0
operation_parameters_minimum_occurrences["getUserLikeNameUsingGET:::size"]=0
operation_parameters_minimum_occurrences["getUserLikeNameUsingGET:::sort"]=0
operation_parameters_minimum_occurrences["listAllUsersUsingGET:::page"]=0
operation_parameters_minimum_occurrences["listAllUsersUsingGET:::size"]=0
operation_parameters_minimum_occurrences["listAllUsersUsingGET:::sort"]=0
operation_parameters_minimum_occurrences["postUserRoleByIdsUsingPOST:::roleid"]=1
operation_parameters_minimum_occurrences["postUserRoleByIdsUsingPOST:::userid"]=1
operation_parameters_minimum_occurrences["updateUserUsingPUT:::id"]=1
operation_parameters_minimum_occurrences["updateUserUsingPUT:::updateUser"]=1
operation_parameters_minimum_occurrences["deleteUserEmailByIdUsingDELETE:::useremailid"]=1
operation_parameters_minimum_occurrences["findUseremailByUserNameUsingGET:::userName"]=1
operation_parameters_minimum_occurrences["getUserEmailByIdUsingGET:::useremailId"]=1
operation_parameters_minimum_occurrences["updateUserEmailUsingPUT:::emailaddress"]=1
operation_parameters_minimum_occurrences["updateUserEmailUsingPUT:::useremailid"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["userLogin:::userLogin"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::newEntry"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::authenticated"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::credentials"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::details"]=0
operation_parameters_maximum_occurrences["addEntryUsingPOST:::principal"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::entryid"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::authenticated"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::credentials"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::details"]=0
operation_parameters_maximum_occurrences["deleteEntryByIdUsingDELETE:::principal"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::entryid"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::authenticated"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::credentials"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::details"]=0
operation_parameters_maximum_occurrences["findEntryByIdUsingGET:::principal"]=0
operation_parameters_maximum_occurrences["getEntriesByUserUsingGET:::authenticated"]=0
operation_parameters_maximum_occurrences["getEntriesByUserUsingGET:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["getEntriesByUserUsingGET:::credentials"]=0
operation_parameters_maximum_occurrences["getEntriesByUserUsingGET:::details"]=0
operation_parameters_maximum_occurrences["getEntriesByUserUsingGET:::principal"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::entryid"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::updateEntry"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::authenticated"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::credentials"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::details"]=0
operation_parameters_maximum_occurrences["updateEntryUsingPUT:::principal"]=0
operation_parameters_maximum_occurrences["addNewUserUsingPOST:::newminuser"]=0
operation_parameters_maximum_occurrences["addNewUserUsingPOST:::getaccess"]=0
operation_parameters_maximum_occurrences["addNewRoleUsingPOST:::newRole"]=0
operation_parameters_maximum_occurrences["addNewRoleUsingPUT:::newRole"]=0
operation_parameters_maximum_occurrences["addNewRoleUsingPUT:::roleid"]=0
operation_parameters_maximum_occurrences["deleteRoleByIdUsingDELETE:::id"]=0
operation_parameters_maximum_occurrences["getRoleByIdUsingGET:::roleId"]=0
operation_parameters_maximum_occurrences["getRoleByNameUsingGET:::roleName"]=0
operation_parameters_maximum_occurrences["addNewUserUsingPOST1:::newuser"]=0
operation_parameters_maximum_occurrences["deleteUserByIdUsingDELETE:::id"]=0
operation_parameters_maximum_occurrences["deleteUserRoleByIdsUsingDELETE:::roleid"]=0
operation_parameters_maximum_occurrences["deleteUserRoleByIdsUsingDELETE:::userid"]=0
operation_parameters_maximum_occurrences["getCurrentUserInfoUsingGET:::authenticated"]=0
operation_parameters_maximum_occurrences["getCurrentUserInfoUsingGET:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["getCurrentUserInfoUsingGET:::credentials"]=0
operation_parameters_maximum_occurrences["getCurrentUserInfoUsingGET:::details"]=0
operation_parameters_maximum_occurrences["getCurrentUserInfoUsingGET:::principal"]=0
operation_parameters_maximum_occurrences["getCurrentUserNameUsingGET:::authenticated"]=0
operation_parameters_maximum_occurrences["getCurrentUserNameUsingGET:::authorities[0].authority"]=0
operation_parameters_maximum_occurrences["getCurrentUserNameUsingGET:::credentials"]=0
operation_parameters_maximum_occurrences["getCurrentUserNameUsingGET:::details"]=0
operation_parameters_maximum_occurrences["getCurrentUserNameUsingGET:::principal"]=0
operation_parameters_maximum_occurrences["getUserByIdUsingGET:::userId"]=0
operation_parameters_maximum_occurrences["getUserByNameUsingGET:::userName"]=0
operation_parameters_maximum_occurrences["getUserLikeNameUsingGET:::userName"]=0
operation_parameters_maximum_occurrences["getUserLikeNameUsingGET:::page"]=0
operation_parameters_maximum_occurrences["getUserLikeNameUsingGET:::size"]=0
operation_parameters_maximum_occurrences["getUserLikeNameUsingGET:::sort"]=0
operation_parameters_maximum_occurrences["listAllUsersUsingGET:::page"]=0
operation_parameters_maximum_occurrences["listAllUsersUsingGET:::size"]=0
operation_parameters_maximum_occurrences["listAllUsersUsingGET:::sort"]=0
operation_parameters_maximum_occurrences["postUserRoleByIdsUsingPOST:::roleid"]=0
operation_parameters_maximum_occurrences["postUserRoleByIdsUsingPOST:::userid"]=0
operation_parameters_maximum_occurrences["updateUserUsingPUT:::id"]=0
operation_parameters_maximum_occurrences["updateUserUsingPUT:::updateUser"]=0
operation_parameters_maximum_occurrences["deleteUserEmailByIdUsingDELETE:::useremailid"]=0
operation_parameters_maximum_occurrences["findUseremailByUserNameUsingGET:::userName"]=0
operation_parameters_maximum_occurrences["getUserEmailByIdUsingGET:::useremailId"]=0
operation_parameters_maximum_occurrences["updateUserEmailUsingPUT:::emailaddress"]=0
operation_parameters_maximum_occurrences["updateUserEmailUsingPUT:::useremailid"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["userLogin:::userLogin"]=""
operation_parameters_collection_type["addEntryUsingPOST:::newEntry"]=""
operation_parameters_collection_type["addEntryUsingPOST:::authenticated"]=""
operation_parameters_collection_type["addEntryUsingPOST:::authorities[0].authority"]=""
operation_parameters_collection_type["addEntryUsingPOST:::credentials"]=
operation_parameters_collection_type["addEntryUsingPOST:::details"]=
operation_parameters_collection_type["addEntryUsingPOST:::principal"]=
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::entryid"]=""
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::authenticated"]=""
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::authorities[0].authority"]=""
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::credentials"]=
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::details"]=
operation_parameters_collection_type["deleteEntryByIdUsingDELETE:::principal"]=
operation_parameters_collection_type["findEntryByIdUsingGET:::entryid"]=""
operation_parameters_collection_type["findEntryByIdUsingGET:::authenticated"]=""
operation_parameters_collection_type["findEntryByIdUsingGET:::authorities[0].authority"]=""
operation_parameters_collection_type["findEntryByIdUsingGET:::credentials"]=
operation_parameters_collection_type["findEntryByIdUsingGET:::details"]=
operation_parameters_collection_type["findEntryByIdUsingGET:::principal"]=
operation_parameters_collection_type["getEntriesByUserUsingGET:::authenticated"]=""
operation_parameters_collection_type["getEntriesByUserUsingGET:::authorities[0].authority"]=""
operation_parameters_collection_type["getEntriesByUserUsingGET:::credentials"]=
operation_parameters_collection_type["getEntriesByUserUsingGET:::details"]=
operation_parameters_collection_type["getEntriesByUserUsingGET:::principal"]=
operation_parameters_collection_type["updateEntryUsingPUT:::entryid"]=""
operation_parameters_collection_type["updateEntryUsingPUT:::updateEntry"]=""
operation_parameters_collection_type["updateEntryUsingPUT:::authenticated"]=""
operation_parameters_collection_type["updateEntryUsingPUT:::authorities[0].authority"]=""
operation_parameters_collection_type["updateEntryUsingPUT:::credentials"]=
operation_parameters_collection_type["updateEntryUsingPUT:::details"]=
operation_parameters_collection_type["updateEntryUsingPUT:::principal"]=
operation_parameters_collection_type["addNewUserUsingPOST:::newminuser"]=""
operation_parameters_collection_type["addNewUserUsingPOST:::getaccess"]=""
operation_parameters_collection_type["addNewRoleUsingPOST:::newRole"]=""
operation_parameters_collection_type["addNewRoleUsingPUT:::newRole"]=""
operation_parameters_collection_type["addNewRoleUsingPUT:::roleid"]=""
operation_parameters_collection_type["deleteRoleByIdUsingDELETE:::id"]=""
operation_parameters_collection_type["getRoleByIdUsingGET:::roleId"]=""
operation_parameters_collection_type["getRoleByNameUsingGET:::roleName"]=""
operation_parameters_collection_type["addNewUserUsingPOST1:::newuser"]=""
operation_parameters_collection_type["deleteUserByIdUsingDELETE:::id"]=""
operation_parameters_collection_type["deleteUserRoleByIdsUsingDELETE:::roleid"]=""
operation_parameters_collection_type["deleteUserRoleByIdsUsingDELETE:::userid"]=""
operation_parameters_collection_type["getCurrentUserInfoUsingGET:::authenticated"]=""
operation_parameters_collection_type["getCurrentUserInfoUsingGET:::authorities[0].authority"]=""
operation_parameters_collection_type["getCurrentUserInfoUsingGET:::credentials"]=
operation_parameters_collection_type["getCurrentUserInfoUsingGET:::details"]=
operation_parameters_collection_type["getCurrentUserInfoUsingGET:::principal"]=
operation_parameters_collection_type["getCurrentUserNameUsingGET:::authenticated"]=""
operation_parameters_collection_type["getCurrentUserNameUsingGET:::authorities[0].authority"]=""
operation_parameters_collection_type["getCurrentUserNameUsingGET:::credentials"]=
operation_parameters_collection_type["getCurrentUserNameUsingGET:::details"]=
operation_parameters_collection_type["getCurrentUserNameUsingGET:::principal"]=
operation_parameters_collection_type["getUserByIdUsingGET:::userId"]=""
operation_parameters_collection_type["getUserByNameUsingGET:::userName"]=""
operation_parameters_collection_type["getUserLikeNameUsingGET:::userName"]=""
operation_parameters_collection_type["getUserLikeNameUsingGET:::page"]=""
operation_parameters_collection_type["getUserLikeNameUsingGET:::size"]=""
operation_parameters_collection_type["getUserLikeNameUsingGET:::sort"]="multi"
operation_parameters_collection_type["listAllUsersUsingGET:::page"]=""
operation_parameters_collection_type["listAllUsersUsingGET:::size"]=""
operation_parameters_collection_type["listAllUsersUsingGET:::sort"]="multi"
operation_parameters_collection_type["postUserRoleByIdsUsingPOST:::roleid"]=""
operation_parameters_collection_type["postUserRoleByIdsUsingPOST:::userid"]=""
operation_parameters_collection_type["updateUserUsingPUT:::id"]=""
operation_parameters_collection_type["updateUserUsingPUT:::updateUser"]=""
operation_parameters_collection_type["deleteUserEmailByIdUsingDELETE:::useremailid"]=""
operation_parameters_collection_type["findUseremailByUserNameUsingGET:::userName"]=""
operation_parameters_collection_type["getUserEmailByIdUsingGET:::useremailId"]=""
operation_parameters_collection_type["updateUserEmailUsingPUT:::emailaddress"]=""
operation_parameters_collection_type["updateUserEmailUsingPUT:::useremailid"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""


##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
    done
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    local body_json="-d '{"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_json+=", "
        fi
        body_json+="\"${key}\": ${body_parameters[${key}]}"
    done
    body_json+="}'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_json}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    local count=0
    for qparam in "${query_params[@]}"; do
        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

        if [[ -n "${parameter_values[*]}" ]]; then
            if [[ $((count++)) -gt 0 ]]; then
                query_request_part+="&"
            fi
        fi


        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'mutli' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}One Line a Day command line client (API version 1.0.0)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[default]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}userLogin${OFF};login
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[entryEndpoints]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}addEntryUsingPOST${OFF};User creates entry
  ${CYAN}deleteEntryByIdUsingDELETE${OFF};User deletes an entry
  ${CYAN}findEntryByIdUsingGET${OFF};User finds entry by ID
  ${CYAN}getEntriesByUserUsingGET${OFF};Returns all entries created by the user
  ${CYAN}updateEntryUsingPUT${OFF};User updates entry
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[logoutEndpoint]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}logoutUsingGET${OFF};logout
  ${CYAN}logoutUsingGET1${OFF};logout
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[openEndpoint]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}addNewUserUsingPOST${OFF};addNewUser
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[rolesEndpoints]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}addNewRoleUsingPOST${OFF};addNewRole
  ${CYAN}addNewRoleUsingPUT${OFF};addNewRole
  ${CYAN}deleteRoleByIdUsingDELETE${OFF};deleteRoleById
  ${CYAN}getRoleByIdUsingGET${OFF};getRoleById
  ${CYAN}getRoleByNameUsingGET${OFF};getRoleByName
  ${CYAN}listRolesUsingGET${OFF};listRoles
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userEndpoints]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}addNewUserUsingPOST1${OFF};adds a user given in the request body
  ${CYAN}deleteUserByIdUsingDELETE${OFF};deleteUserById
  ${CYAN}deleteUserRoleByIdsUsingDELETE${OFF};deleteUserRoleByIds
  ${CYAN}getCurrentUserInfoUsingGET${OFF};getCurrentUserInfo
  ${CYAN}getCurrentUserNameUsingGET${OFF};getCurrentUserName
  ${CYAN}getNumUserEmailsUsingGET${OFF};getNumUserEmails
  ${CYAN}getUserByIdUsingGET${OFF};Retrieve a user based of off user id
  ${CYAN}getUserByNameUsingGET${OFF};returns the user based off of user name
  ${CYAN}getUserLikeNameUsingGET${OFF};returns all Users whose name contains the given substring with paging and sorting
  ${CYAN}listAllUsersUsingGET${OFF};returns all Users with paging and sorting
  ${CYAN}postUserRoleByIdsUsingPOST${OFF};postUserRoleByIds
  ${CYAN}reallyListAllUsersUsingGET${OFF};returns all Users without paging or sorting
  ${CYAN}updateUserUsingPUT${OFF};updateUser
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[useremailEndpoints]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}deleteUserEmailByIdUsingDELETE${OFF};deleteUserEmailById
  ${CYAN}findUseremailByUserNameUsingGET${OFF};findUseremailByUserName
  ${CYAN}getUserEmailByIdUsingGET${OFF};getUserEmailById
  ${CYAN}listAllUseremailsUsingGET${OFF};listAllUseremails
  ${CYAN}updateUserEmailUsingPUT${OFF};updateUserEmail
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://lambdaschool-onelineaday.herokuapp.com')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}One Line a Day command line client (API version 1.0.0)${OFF}"
    echo ""
    echo -e "License: MIT"
    echo -e "Contact: itsmaitran@gmail.com"
    echo ""
read -r -d '' appdescription <<EOF

Backend Documentation
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}One Line a Day command line client (API version 1.0.0)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for userLogin operation
#
##############################################################################
print_userLogin_help() {
    echo ""
    echo -e "${BOLD}${WHITE}userLogin - login${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "This is the login endpoint to request an authentication token" | paste -sd' ' | fold -sw 80
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[]${OFF} ${RED}(required)${OFF}${OFF} - Login Parameter" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for addEntryUsingPOST operation
#
##############################################################################
print_addEntryUsingPOST_help() {
    echo ""
    echo -e "${BOLD}${WHITE}addEntryUsingPOST - User creates entry${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - newEntry" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteEntryByIdUsingDELETE operation
#
##############################################################################
print_deleteEntryByIdUsingDELETE_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteEntryByIdUsingDELETE - User deletes an entry${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entryid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - entryid ${YELLOW}Specify as: entryid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Entry Successfully Deleted${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Entry Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for findEntryByIdUsingGET operation
#
##############################################################################
print_findEntryByIdUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}findEntryByIdUsingGET - User finds entry by ID${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entryid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - entryid ${YELLOW}Specify as: entryid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getEntriesByUserUsingGET operation
#
##############################################################################
print_getEntriesByUserUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getEntriesByUserUsingGET - Returns all entries created by the user${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateEntryUsingPUT operation
#
##############################################################################
print_updateEntryUsingPUT_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateEntryUsingPUT - User updates entry${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}entryid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - entryid ${YELLOW}Specify as: entryid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - updateEntry" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for logoutUsingGET operation
#
##############################################################################
print_logoutUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}logoutUsingGET - logout${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for logoutUsingGET1 operation
#
##############################################################################
print_logoutUsingGET1_help() {
    echo ""
    echo -e "${BOLD}${WHITE}logoutUsingGET1 - logout${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for addNewUserUsingPOST operation
#
##############################################################################
print_addNewUserUsingPOST_help() {
    echo ""
    echo -e "${BOLD}${WHITE}addNewUserUsingPOST - addNewUser${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}getaccess${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: true)${OFF} - getaccess${YELLOW} Specify as: getaccess=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - newminuser" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for addNewRoleUsingPOST operation
#
##############################################################################
print_addNewRoleUsingPOST_help() {
    echo ""
    echo -e "${BOLD}${WHITE}addNewRoleUsingPOST - addNewRole${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - newRole" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for addNewRoleUsingPUT operation
#
##############################################################################
print_addNewRoleUsingPUT_help() {
    echo ""
    echo -e "${BOLD}${WHITE}addNewRoleUsingPUT - addNewRole${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}roleid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - roleid ${YELLOW}Specify as: roleid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - newRole" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteRoleByIdUsingDELETE operation
#
##############################################################################
print_deleteRoleByIdUsingDELETE_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteRoleByIdUsingDELETE - deleteRoleById${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - id ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRoleByIdUsingGET operation
#
##############################################################################
print_getRoleByIdUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRoleByIdUsingGET - getRoleById${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}roleId${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - roleId ${YELLOW}Specify as: roleId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getRoleByNameUsingGET operation
#
##############################################################################
print_getRoleByNameUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getRoleByNameUsingGET - getRoleByName${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}roleName${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - roleName ${YELLOW}Specify as: roleName=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listRolesUsingGET operation
#
##############################################################################
print_listRolesUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listRolesUsingGET - listRoles${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for addNewUserUsingPOST1 operation
#
##############################################################################
print_addNewUserUsingPOST1_help() {
    echo ""
    echo -e "${BOLD}${WHITE}addNewUserUsingPOST1 - adds a user given in the request body${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - newuser" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;User Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserByIdUsingDELETE operation
#
##############################################################################
print_deleteUserByIdUsingDELETE_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserByIdUsingDELETE - deleteUserById${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - id ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserRoleByIdsUsingDELETE operation
#
##############################################################################
print_deleteUserRoleByIdsUsingDELETE_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserRoleByIdsUsingDELETE - deleteUserRoleByIds${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}roleid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - roleid ${YELLOW}Specify as: roleid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - userid ${YELLOW}Specify as: userid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCurrentUserInfoUsingGET operation
#
##############################################################################
print_getCurrentUserInfoUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCurrentUserInfoUsingGET - getCurrentUserInfo${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCurrentUserNameUsingGET operation
#
##############################################################################
print_getCurrentUserNameUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCurrentUserNameUsingGET - getCurrentUserName${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}authenticated${OFF} ${BLUE}[boolean]${OFF}${OFF} - ${YELLOW} Specify as: authenticated=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}authorities[0].authority${OFF} ${BLUE}[string]${OFF}${OFF} - ${YELLOW} Specify as: authorities[0].authority=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}credentials${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}details${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}principal${OFF} ${BLUE}[map[String, string]]${OFF}${OFF} - ${YELLOW} Specify as: ${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getNumUserEmailsUsingGET operation
#
##############################################################################
print_getNumUserEmailsUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getNumUserEmailsUsingGET - getNumUserEmails${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserByIdUsingGET operation
#
##############################################################################
print_getUserByIdUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserByIdUsingGET - Retrieve a user based of off user id${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}userId${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - User id ${YELLOW}Specify as: userId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;User Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserByNameUsingGET operation
#
##############################################################################
print_getUserByNameUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserByNameUsingGET - returns the user based off of user name${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}userName${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - Username ${YELLOW}Specify as: userName=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;User Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;User Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserLikeNameUsingGET operation
#
##############################################################################
print_getUserLikeNameUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserLikeNameUsingGET - returns all Users whose name contains the given substring with paging and sorting${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}userName${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - Username ${YELLOW}Specify as: userName=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[Object]${OFF}${OFF} - Results page you want to retrieve (1..N)${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}size${OFF} ${BLUE}[Object]${OFF}${OFF} - Number of records per page.${YELLOW} Specify as: size=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort${OFF} ${BLUE}[array[string]]${OFF}${OFF} - Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported.${YELLOW} Specify as: sort=value1 sort=value2 sort=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAllUsersUsingGET operation
#
##############################################################################
print_listAllUsersUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAllUsersUsingGET - returns all Users with paging and sorting${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}page${OFF} ${BLUE}[Object]${OFF}${OFF} - Results page you want to retrieve (1..N)${YELLOW} Specify as: page=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}size${OFF} ${BLUE}[Object]${OFF}${OFF} - Number of records per page.${YELLOW} Specify as: size=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}sort${OFF} ${BLUE}[array[string]]${OFF}${OFF} - Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported.${YELLOW} Specify as: sort=value1 sort=value2 sort=...${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for postUserRoleByIdsUsingPOST operation
#
##############################################################################
print_postUserRoleByIdsUsingPOST_help() {
    echo ""
    echo -e "${BOLD}${WHITE}postUserRoleByIdsUsingPOST - postUserRoleByIds${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}roleid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - roleid ${YELLOW}Specify as: roleid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}userid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - userid ${YELLOW}Specify as: userid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for reallyListAllUsersUsingGET operation
#
##############################################################################
print_reallyListAllUsersUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}reallyListAllUsersUsingGET - returns all Users without paging or sorting${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateUserUsingPUT operation
#
##############################################################################
print_updateUserUsingPUT_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateUserUsingPUT - updateUser${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}id${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - id ${YELLOW}Specify as: id=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - updateUser" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserEmailByIdUsingDELETE operation
#
##############################################################################
print_deleteUserEmailByIdUsingDELETE_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserEmailByIdUsingDELETE - deleteUserEmailById${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}useremailid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - useremailid ${YELLOW}Specify as: useremailid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for findUseremailByUserNameUsingGET operation
#
##############################################################################
print_findUseremailByUserNameUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}findUseremailByUserNameUsingGET - findUseremailByUserName${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}userName${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - userName ${YELLOW}Specify as: userName=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserEmailByIdUsingGET operation
#
##############################################################################
print_getUserEmailByIdUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserEmailByIdUsingGET - getUserEmailById${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}useremailId${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - useremailId ${YELLOW}Specify as: useremailId=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAllUseremailsUsingGET operation
#
##############################################################################
print_listAllUseremailsUsingGET_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAllUseremailsUsingGET - listAllUseremails${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateUserEmailUsingPUT operation
#
##############################################################################
print_updateUserEmailUsingPUT_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateUserEmailUsingPUT - updateUserEmail${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}emailaddress${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF}${OFF} - emailaddress ${YELLOW}Specify as: emailaddress=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}useremailid${OFF} ${BLUE}[integer]${OFF} ${RED}(required)${OFF}${OFF} - useremailid ${YELLOW}Specify as: useremailid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;OK${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}


##############################################################################
#
# Call userLogin operation
#
##############################################################################
call_userLogin() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/login" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call addEntryUsingPOST operation
#
##############################################################################
call_addEntryUsingPOST() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/entries/entry" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteEntryByIdUsingDELETE operation
#
##############################################################################
call_deleteEntryByIdUsingDELETE() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(entryid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/entries/entry/{entryid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call findEntryByIdUsingGET operation
#
##############################################################################
call_findEntryByIdUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(entryid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/entries/entry/{entryid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getEntriesByUserUsingGET operation
#
##############################################################################
call_getEntriesByUserUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/entries/entries" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call updateEntryUsingPUT operation
#
##############################################################################
call_updateEntryUsingPUT() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(entryid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/entries/entry/{entryid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call logoutUsingGET operation
#
##############################################################################
call_logoutUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/logout" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call logoutUsingGET1 operation
#
##############################################################################
call_logoutUsingGET1() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/oauth/revoke-token" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call addNewUserUsingPOST operation
#
##############################################################################
call_addNewUserUsingPOST() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(getaccess)
    local path

    if ! path=$(build_request_path "/createnewuser" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call addNewRoleUsingPOST operation
#
##############################################################################
call_addNewRoleUsingPOST() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/role" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call addNewRoleUsingPUT operation
#
##############################################################################
call_addNewRoleUsingPUT() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(roleid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/role/{roleid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteRoleByIdUsingDELETE operation
#
##############################################################################
call_deleteRoleByIdUsingDELETE() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/role/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getRoleByIdUsingGET operation
#
##############################################################################
call_getRoleByIdUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(roleId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/role/{roleId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getRoleByNameUsingGET operation
#
##############################################################################
call_getRoleByNameUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(roleName)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/role/name/{roleName}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listRolesUsingGET operation
#
##############################################################################
call_listRolesUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/roles/roles" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call addNewUserUsingPOST1 operation
#
##############################################################################
call_addNewUserUsingPOST1() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUserByIdUsingDELETE operation
#
##############################################################################
call_deleteUserByIdUsingDELETE() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call deleteUserRoleByIdsUsingDELETE operation
#
##############################################################################
call_deleteUserRoleByIdsUsingDELETE() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(roleid userid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/{userid}/role/{roleid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCurrentUserInfoUsingGET operation
#
##############################################################################
call_getCurrentUserInfoUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/users/getuserinfo" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCurrentUserNameUsingGET operation
#
##############################################################################
call_getCurrentUserNameUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(authenticated authorities[0].authority credentials details principal)
    local path

    if ! path=$(build_request_path "/users/getusername" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getNumUserEmailsUsingGET operation
#
##############################################################################
call_getNumUserEmailsUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/email/count" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserByIdUsingGET operation
#
##############################################################################
call_getUserByIdUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(userId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/{userId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserByNameUsingGET operation
#
##############################################################################
call_getUserByNameUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(userName)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/name/{userName}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserLikeNameUsingGET operation
#
##############################################################################
call_getUserLikeNameUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(userName)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page size sort)
    local path

    if ! path=$(build_request_path "/users/user/name/like/{userName}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listAllUsersUsingGET operation
#
##############################################################################
call_listAllUsersUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(page size sort)
    local path

    if ! path=$(build_request_path "/users/users" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call postUserRoleByIdsUsingPOST operation
#
##############################################################################
call_postUserRoleByIdsUsingPOST() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(roleid userid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/{userid}/role/{roleid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call reallyListAllUsersUsingGET operation
#
##############################################################################
call_reallyListAllUsersUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/allusers" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call updateUserUsingPUT operation
#
##############################################################################
call_updateUserUsingPUT() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(id)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/users/user/{id}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUserEmailByIdUsingDELETE operation
#
##############################################################################
call_deleteUserEmailByIdUsingDELETE() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(useremailid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/useremails/useremail/{useremailid}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call findUseremailByUserNameUsingGET operation
#
##############################################################################
call_findUseremailByUserNameUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(userName)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/useremails/username/{userName}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserEmailByIdUsingGET operation
#
##############################################################################
call_getUserEmailByIdUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(useremailId)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/useremails/useremail/{useremailId}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listAllUseremailsUsingGET operation
#
##############################################################################
call_listAllUseremailsUsingGET() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/useremails/useremails" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call updateUserEmailUsingPUT operation
#
##############################################################################
call_updateUserEmailUsingPUT() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(emailaddress useremailid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/useremails/useremail/{useremailid}/email/{emailaddress}" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    userLogin)
    operation="userLogin"
    ;;
    addEntryUsingPOST)
    operation="addEntryUsingPOST"
    ;;
    deleteEntryByIdUsingDELETE)
    operation="deleteEntryByIdUsingDELETE"
    ;;
    findEntryByIdUsingGET)
    operation="findEntryByIdUsingGET"
    ;;
    getEntriesByUserUsingGET)
    operation="getEntriesByUserUsingGET"
    ;;
    updateEntryUsingPUT)
    operation="updateEntryUsingPUT"
    ;;
    logoutUsingGET)
    operation="logoutUsingGET"
    ;;
    logoutUsingGET1)
    operation="logoutUsingGET1"
    ;;
    addNewUserUsingPOST)
    operation="addNewUserUsingPOST"
    ;;
    addNewRoleUsingPOST)
    operation="addNewRoleUsingPOST"
    ;;
    addNewRoleUsingPUT)
    operation="addNewRoleUsingPUT"
    ;;
    deleteRoleByIdUsingDELETE)
    operation="deleteRoleByIdUsingDELETE"
    ;;
    getRoleByIdUsingGET)
    operation="getRoleByIdUsingGET"
    ;;
    getRoleByNameUsingGET)
    operation="getRoleByNameUsingGET"
    ;;
    listRolesUsingGET)
    operation="listRolesUsingGET"
    ;;
    addNewUserUsingPOST1)
    operation="addNewUserUsingPOST1"
    ;;
    deleteUserByIdUsingDELETE)
    operation="deleteUserByIdUsingDELETE"
    ;;
    deleteUserRoleByIdsUsingDELETE)
    operation="deleteUserRoleByIdsUsingDELETE"
    ;;
    getCurrentUserInfoUsingGET)
    operation="getCurrentUserInfoUsingGET"
    ;;
    getCurrentUserNameUsingGET)
    operation="getCurrentUserNameUsingGET"
    ;;
    getNumUserEmailsUsingGET)
    operation="getNumUserEmailsUsingGET"
    ;;
    getUserByIdUsingGET)
    operation="getUserByIdUsingGET"
    ;;
    getUserByNameUsingGET)
    operation="getUserByNameUsingGET"
    ;;
    getUserLikeNameUsingGET)
    operation="getUserLikeNameUsingGET"
    ;;
    listAllUsersUsingGET)
    operation="listAllUsersUsingGET"
    ;;
    postUserRoleByIdsUsingPOST)
    operation="postUserRoleByIdsUsingPOST"
    ;;
    reallyListAllUsersUsingGET)
    operation="reallyListAllUsersUsingGET"
    ;;
    updateUserUsingPUT)
    operation="updateUserUsingPUT"
    ;;
    deleteUserEmailByIdUsingDELETE)
    operation="deleteUserEmailByIdUsingDELETE"
    ;;
    findUseremailByUserNameUsingGET)
    operation="findUseremailByUserNameUsingGET"
    ;;
    getUserEmailByIdUsingGET)
    operation="getUserEmailByIdUsingGET"
    ;;
    listAllUseremailsUsingGET)
    operation="listAllUseremailsUsingGET"
    ;;
    updateUserEmailUsingPUT)
    operation="updateUserEmailUsingPUT"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without qoutes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +\([^=]\):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    userLogin)
    call_userLogin
    ;;
    addEntryUsingPOST)
    call_addEntryUsingPOST
    ;;
    deleteEntryByIdUsingDELETE)
    call_deleteEntryByIdUsingDELETE
    ;;
    findEntryByIdUsingGET)
    call_findEntryByIdUsingGET
    ;;
    getEntriesByUserUsingGET)
    call_getEntriesByUserUsingGET
    ;;
    updateEntryUsingPUT)
    call_updateEntryUsingPUT
    ;;
    logoutUsingGET)
    call_logoutUsingGET
    ;;
    logoutUsingGET1)
    call_logoutUsingGET1
    ;;
    addNewUserUsingPOST)
    call_addNewUserUsingPOST
    ;;
    addNewRoleUsingPOST)
    call_addNewRoleUsingPOST
    ;;
    addNewRoleUsingPUT)
    call_addNewRoleUsingPUT
    ;;
    deleteRoleByIdUsingDELETE)
    call_deleteRoleByIdUsingDELETE
    ;;
    getRoleByIdUsingGET)
    call_getRoleByIdUsingGET
    ;;
    getRoleByNameUsingGET)
    call_getRoleByNameUsingGET
    ;;
    listRolesUsingGET)
    call_listRolesUsingGET
    ;;
    addNewUserUsingPOST1)
    call_addNewUserUsingPOST1
    ;;
    deleteUserByIdUsingDELETE)
    call_deleteUserByIdUsingDELETE
    ;;
    deleteUserRoleByIdsUsingDELETE)
    call_deleteUserRoleByIdsUsingDELETE
    ;;
    getCurrentUserInfoUsingGET)
    call_getCurrentUserInfoUsingGET
    ;;
    getCurrentUserNameUsingGET)
    call_getCurrentUserNameUsingGET
    ;;
    getNumUserEmailsUsingGET)
    call_getNumUserEmailsUsingGET
    ;;
    getUserByIdUsingGET)
    call_getUserByIdUsingGET
    ;;
    getUserByNameUsingGET)
    call_getUserByNameUsingGET
    ;;
    getUserLikeNameUsingGET)
    call_getUserLikeNameUsingGET
    ;;
    listAllUsersUsingGET)
    call_listAllUsersUsingGET
    ;;
    postUserRoleByIdsUsingPOST)
    call_postUserRoleByIdsUsingPOST
    ;;
    reallyListAllUsersUsingGET)
    call_reallyListAllUsersUsingGET
    ;;
    updateUserUsingPUT)
    call_updateUserUsingPUT
    ;;
    deleteUserEmailByIdUsingDELETE)
    call_deleteUserEmailByIdUsingDELETE
    ;;
    findUseremailByUserNameUsingGET)
    call_findUseremailByUserNameUsingGET
    ;;
    getUserEmailByIdUsingGET)
    call_getUserEmailByIdUsingGET
    ;;
    listAllUseremailsUsingGET)
    call_listAllUseremailsUsingGET
    ;;
    updateUserEmailUsingPUT)
    call_updateUserEmailUsingPUT
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
