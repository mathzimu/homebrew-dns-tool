# homebrew-dns-tool

Homebrew formula for [dns-client-tool](https://github.com/mathzimu/dns-client-tool).

## Install

```bash
brew tap mathzimu/dns-tool
brew install dns-tool
```

## Usage

### Background service (dns-server)

Start the DNS server as a background service:

```bash
brew services start dns-tool
```

Check status:

```bash
brew services list
```

Stop the service:

```bash
brew services stop dns-tool
```

Restart the service:

```bash
brew services restart dns-tool
```

### Client (dns-client)

Launch the DNS client GUI:

```bash
dns-client
```

### Run server manually

```bash
dns-server -p 8053
```
