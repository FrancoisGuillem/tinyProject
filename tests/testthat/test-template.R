describe(".prTemplate", {
  it("finds template by name", {
    expect_match(.prTemplate("test", "function"), "function.brew")
  })
  
  it("throws error if template name is invalid", {
    expect_error(.prTemplate("test", "test"), "'template' should be one of")
  })
  
  it("finds template by pattern", {
    expect_match(.prTemplate("data/test"), "data.brew")
  })
  
  it("returns default template if no match", {
    expect_match(.prTemplate("test"), "analysis.brew")
  })
})

describe("prRegisterTemplate", {
  templates <- getOption("prTemplates")
  
  it("adds a new template", {
    prRegisterTemplate("test", "test.brew", "^test")
    expect_match(.prTemplate("script", "test"), "test.brew")
    expect_match(.prTemplate("test"), "test.brew")
  })
  
  it("sets a new default template", {
    prRegisterTemplate("newdefault", "default.brew", default = TRUE)
    expect_match(.prTemplate("script"), "default.brew")
  })
  
  it("overhides a template", {
    prRegisterTemplate("test", "test2.brew", "^test")
    expect_match(.prTemplate("script", "test"), "test2.brew")
    expect_match(.prTemplate("test"), "test2.brew")
  })
  
  options(prTemplates = templates)
})