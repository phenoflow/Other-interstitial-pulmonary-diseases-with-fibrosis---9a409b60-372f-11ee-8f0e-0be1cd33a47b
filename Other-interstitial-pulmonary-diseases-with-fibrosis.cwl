cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  other-interstitial-pulmonary-diseases-with-fibrosis---primary:
    run: other-interstitial-pulmonary-diseases-with-fibrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  other-interstitial-pulmonary-diseases-with-fibrosis-alveolitis---primary:
    run: other-interstitial-pulmonary-diseases-with-fibrosis-alveolitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: other-interstitial-pulmonary-diseases-with-fibrosis---primary/output
  idiopathic-other-interstitial-pulmonary-diseases-with-fibrosis---primary:
    run: idiopathic-other-interstitial-pulmonary-diseases-with-fibrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: other-interstitial-pulmonary-diseases-with-fibrosis-alveolitis---primary/output
  fibrosis---primary:
    run: fibrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: idiopathic-other-interstitial-pulmonary-diseases-with-fibrosis---primary/output
  other-interstitial-pulmonary-other-interstitial-pulmonary-diseases-with-fibrosis-fibrosis---secondary:
    run: other-interstitial-pulmonary-other-interstitial-pulmonary-diseases-with-fibrosis-fibrosis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: fibrosis---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-interstitial-pulmonary-other-interstitial-pulmonary-diseases-with-fibrosis-fibrosis---secondary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
