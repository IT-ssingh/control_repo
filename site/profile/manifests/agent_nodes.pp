class profile::agent_nodes {
  include dockergent 
  dockeragent:node {'web.puppet.vm':}
  dockeragent:node {'db.puppet.vm':}
}
