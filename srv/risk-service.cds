using {riskmanagement as rm} from '../db/schema';

/**
 * For serving end users
 */
service RiskService @(path : 'service/risk') {

    entity Risks @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ])                      as projection on rm.Risks;

    entity Mitigations @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ])                      as projection on rm.Mitigations;

    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;

    annotate Risks with @odata.draft.enabled;
    annotate Mitigations with @odata.draft.enabled;

}
