# EntryEndpointsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**addEntryUsingPOST**](EntryEndpointsApi.md#addEntryUsingPOST) | **POST** /entries/entry | User creates entry
[**deleteEntryByIdUsingDELETE**](EntryEndpointsApi.md#deleteEntryByIdUsingDELETE) | **DELETE** /entries/entry/{entryid} | User deletes an entry
[**findEntryByIdUsingGET**](EntryEndpointsApi.md#findEntryByIdUsingGET) | **GET** /entries/entry/{entryid} | User finds entry by ID
[**getEntriesByUserUsingGET**](EntryEndpointsApi.md#getEntriesByUserUsingGET) | **GET** /entries/entries | Returns all entries created by the user
[**updateEntryUsingPUT**](EntryEndpointsApi.md#updateEntryUsingPUT) | **PUT** /entries/entry/{entryid} | User updates entry


## **addEntryUsingPOST**

User creates entry

### Example
```bash
 addEntryUsingPOST  authenticated=value  authorities[0].authority=value  Specify as:   Specify as:   Specify as: 
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newEntry** | [**Entry**](Entry.md) | newEntry |
 **authenticated** | **boolean** |  | [optional]
 **authorities[0].authority** | **string** |  | [optional]
 **credentials** | [**map[String, string]**](string.md) |  | [optional]
 **details** | [**map[String, string]**](string.md) |  | [optional]
 **principal** | [**map[String, string]**](string.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteEntryByIdUsingDELETE**

User deletes an entry

### Example
```bash
 deleteEntryByIdUsingDELETE entryid=value  authenticated=value  authorities[0].authority=value  Specify as:   Specify as:   Specify as: 
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entryid** | **integer** | entryid |
 **authenticated** | **boolean** |  | [optional]
 **authorities[0].authority** | **string** |  | [optional]
 **credentials** | [**map[String, string]**](string.md) |  | [optional]
 **details** | [**map[String, string]**](string.md) |  | [optional]
 **principal** | [**map[String, string]**](string.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **findEntryByIdUsingGET**

User finds entry by ID

### Example
```bash
 findEntryByIdUsingGET entryid=value  authenticated=value  authorities[0].authority=value  Specify as:   Specify as:   Specify as: 
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entryid** | **integer** | entryid |
 **authenticated** | **boolean** |  | [optional]
 **authorities[0].authority** | **string** |  | [optional]
 **credentials** | [**map[String, string]**](string.md) |  | [optional]
 **details** | [**map[String, string]**](string.md) |  | [optional]
 **principal** | [**map[String, string]**](string.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getEntriesByUserUsingGET**

Returns all entries created by the user

### Example
```bash
 getEntriesByUserUsingGET  authenticated=value  authorities[0].authority=value  Specify as:   Specify as:   Specify as: 
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authenticated** | **boolean** |  | [optional]
 **authorities[0].authority** | **string** |  | [optional]
 **credentials** | [**map[String, string]**](string.md) |  | [optional]
 **details** | [**map[String, string]**](string.md) |  | [optional]
 **principal** | [**map[String, string]**](string.md) |  | [optional]

### Return type

[**array[Entry]**](Entry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **updateEntryUsingPUT**

User updates entry

### Example
```bash
 updateEntryUsingPUT entryid=value  authenticated=value  authorities[0].authority=value  Specify as:   Specify as:   Specify as: 
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **entryid** | **integer** | entryid |
 **updateEntry** | [**Entry**](Entry.md) | updateEntry |
 **authenticated** | **boolean** |  | [optional]
 **authorities[0].authority** | **string** |  | [optional]
 **credentials** | [**map[String, string]**](string.md) |  | [optional]
 **details** | [**map[String, string]**](string.md) |  | [optional]
 **principal** | [**map[String, string]**](string.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

