// Add this at the start of your script
const isGitHubPages = window.location.hostname.includes('github.io');
const baseUrl = isGitHubPages ? '/audaa' : '';

// Update your API calls
async function callApi(endpoint, data) {
    const url = isGitHubPages 
        ? `https://api.zyphra.com/v1/${endpoint}`  // Direct to Zyphra API
        : `/${endpoint}`;  // Local development
    
    // Rest of your API call code...
} 