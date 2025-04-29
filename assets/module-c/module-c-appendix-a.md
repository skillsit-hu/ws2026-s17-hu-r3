## Machine Information

```
GET /machineInfo
```

Returns static information about the machine:

```json
{
  "id": "1",
  "name": "Sudsy WM-0001",
  "type": "Washing Machine",
  "brand": "Samsung",
  "model": "WF10000",
  "availablePrograms": [
    {
      "name": "Normal",
      "spinSpeed": [800, 1200, 1600],
      "temperature": [30, 40, 50],
      "duration": 5400
    },
    {
      "name": "Quick Wash",
      "spinSpeed": [800, 1200, 1600],
      "temperature": [30, 40, 50],
      "duration": 1800
    }
  ]
}
```

## Machine Status

```
GET /status
```

Returns current machine status:

```json
{
  "status": "operational",
  "currentProgram": {
    "name": "Normal",
    "parameters": {
      "spinSpeed": 1200,
      "temperature": 40
    },
    "remainingTime": 1800,
    "startedAt": "2025-04-29T10:30:00Z"
  }
}
```

```json
{
  "operationalStatus": "idle",
  "currentProgram": null
}
```

## Control Endpoints

### Start Program

```
POST /control/start
```

Request body:

```json
{
  "name": "Normal",
  "temperature": 30,
  "spinSpeed": 1200
}
```

Response: 200 OK on success

### Stop Program

```
POST /control/stop
```

Response: 200 OK on success

### Pause Program

```
POST /control/pause
```

Response: 200 OK on success

### Resume Program

```
POST /control/resume
```

Response: 200 OK on success

## Error Handling

- All endpoints return appropriate HTTP status codes
- Error responses include a message:

```json
{
  "error": "Error description"
}
```

Common error codes:

- 409: Operation not allowed in current state
- 500: Internal machine error
