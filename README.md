# Event ID Generator - GTM Variable Template

A Google Tag Manager custom variable template that generates unique event IDs for tracking events across your website.

## Overview

This template creates a unique identifier for each page session that can be used to track and correlate events. The ID is generated once per page load and reused for all subsequent events on that page, making it perfect for event tracking, debugging, and analytics correlation.

## Features

- **Unique Event IDs**: Generates a unique identifier combining timestamp and random characters
- **Session Persistence**: Reuses the same ID across all events on the same page
- **Customizable Prefix**: Add your own prefix to identify events from different sources
- **Configurable Length**: Adjust the random component length to suit your needs
- **Lightweight**: Minimal performance impact on your site

## Installation

1. Go to your Google Tag Manager container
2. Navigate to **Templates** in the left sidebar
3. In the **Variable Templates** section, click **Search Gallery**
4. Search for "Event ID Generator"
5. Click on the template and then click **Add to workspace**
6. Click **Add** to confirm

Alternatively, you can import the template manually:
1. Download the `template.tpl` file from this repository
2. In GTM, go to **Templates** > **Variable Templates**
3. Click **New** and then click the menu icon (⋮) in the top right
4. Select **Import** and upload the `template.tpl` file

## Configuration

### Parameters

| Parameter | Description | Default | Required |
|-----------|-------------|---------|----------|
| **Prefix** | A string prefix to prepend to the event ID (e.g., "DOT", "PROD") | `dot` | No |
| **Random Length** | The number of random characters to include in the ID | `10` | No |

### Event ID Format

The generated event ID follows this format:
```
[PREFIX]-[TIMESTAMP]-[RANDOM_CHARS]
```

Example output:
```
DOT-1700082799123-A3K9F7B2X1
```

## Usage

### Creating the Variable

1. Go to **Variables** in your GTM container
2. Under **User-Defined Variables**, click **New**
3. Click on the variable configuration area
4. Select **Event ID Generator** from the custom templates
5. Configure the prefix and random length as needed
6. Name your variable (e.g., "Event ID")
7. Save the variable

### Using in Tags

Once created, you can use this variable in any tag, trigger, or other variable:

**In a GA4 Event Tag:**
```
Event Name: custom_event
Event Parameters:
  event_id: {{Event ID}}
```

**In a Custom HTML Tag:**
```javascript
<script>
  dataLayer.push({
    'event': 'custom_event',
    'event_id': '{{Event ID}}'
  });
</script>
```

**In a Data Layer Variable:**
```
Data Layer Variable Name: event_id
Default Value: {{Event ID}}
```

## How It Works

1. On first call, the template generates a unique ID by combining:
   - Current timestamp in milliseconds
   - A random string of uppercase letters and numbers
2. The generated ID is stored in `window._randomPageId`
3. Subsequent calls on the same page retrieve the stored ID
4. The ID is prefixed with your configured prefix
5. Each new page load generates a fresh ID

## Use Cases

- **Event Correlation**: Link related events that occur during the same session
- **Debugging**: Track event sequences and troubleshoot issues
- **Analytics**: Group and analyze events by session
- **A/B Testing**: Associate test variants with specific sessions
- **Error Tracking**: Correlate errors with specific user sessions

## Technical Details

### Permissions Required

- **Access Globals**: Read and write access to `_randomPageId` variable

### Browser Compatibility

Works in all modern browsers that support Google Tag Manager.

## Version History

See [metadata.yaml](metadata.yaml) for detailed version history and change notes.

## Support

For issues, questions, or contributions, please visit:
- Website: [https://dotlvn.com/](https://dotlvn.com/)
- Repository: [https://github.com/dotlvn/gtm-templates](https://github.com/dotlvn/gtm-templates)

## License

See [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

**Note**: This template follows Google Tag Manager's Community Template Gallery Developer Terms of Service.
