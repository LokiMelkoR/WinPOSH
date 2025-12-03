# WinPosh AI Agent Instructions

## Project Overview
WinPosh is a Windows PowerShell repository containing reusable scripts, snippets, and commands for system administration tasks. It's organized by functional domain (user management, VDI administration, group operations) and serves as a code reference library.

## Architecture & Organization

### Directory Structure
- **`Group_Work/`** - Active Directory group management operations (e.g., listing group members)
- **`user/`** - User account operations, particularly AD user profile retrieval (TSprofile paths)
- **`VDI QA/`** - Virtual Desktop Infrastructure cleanup and optimization scripts

### Key Patterns
1. **Reusable Code Snippets** - Files contain partial or complete PowerShell commands meant to be adapted and reused, not monolithic applications
2. **Active Directory Focus** - Heavy reliance on Active Directory cmdlets (`Get-ADUser`, `Get-ADGroupMember`, `[ADSI]`)
3. **Comment-Based Documentation** - Inline comments explain when/how to use snippets, with placeholders like `<samaccountname>` and `<group>`

## PowerShell Conventions

### When Adding Scripts:
- Use **comment blocks** (`##`) to explain purpose, especially for snippets
- Include placeholders (e.g., `<group>`, `<samaccountname>`) for values that users must customize
- Preserve commented-out alternatives showing different approaches (see `GetTSprofile` file)
- Follow `Write-Host` for user feedback in VDI/cleanup scripts
- Use `Select-Object` and `Sort-Object` for output formatting in queries

### Common Modules & Cmdlets
- **Active Directory Module**: `Get-ADUser`, `Get-ADGroupMember`, `[ADSI]` LDAP bindings
- **Appx Management**: `Get-AppxProvisionedPackage`, `Remove-AppxProvisionedPackage` (VDI scenarios)
- **Error Handling**: Use conditional `if` statements on success/failure of operations (see `WindowsBloatware.ps1`)

## Development Workflows

### No Build System
This is a script library, not compiled code. Updates are direct file modifications.

### Testing Approach
Scripts are intended for manual execution in PowerShell. When suggesting changes:
- Ensure cmdlet syntax is correct for Windows PowerShell 5.1
- Provide clear comment blocks about what the script does before execution
- Include error handling where operations have failure states (e.g., app removal)

### Execution Context
- Scripts assume PowerShell execution policy allows script execution
- AD cmdlets require domain-connected systems with Active Directory module
- AppxProvisionedPackage operations typically require elevated privileges (Admin)

## Integration Points

### Active Directory Dependencies
- Domain connectivity required for AD cmdlets
- LDAP path construction: `LDAP://` + DistinguishedName from AD queries
- User and group lookups use samAccountName or distinguished names

### File Naming
- Use descriptive names without spaces where possible (Group_Work folder violates this)
- Consider renaming folders to use hyphens/underscores instead of spaces for consistency

## Guidance for AI Agents

- **Preserve existing patterns**: Maintain comment styles, placeholders, and snippet organization
- **Assume manual execution**: Don't add build steps or automated runner code
- **Document clearly**: New snippets should explain parameters and prerequisites
- **Check syntax carefully**: PowerShell version compatibility matters (avoid PS 7+ specific features unless noted)
- **Include AD context**: Clarify whether scripts need domain membership or specific permissions
