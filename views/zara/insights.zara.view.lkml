include: "/views/_base/insights.view.lkml"

view: +insights {

  dimension: country {
    type: string
    map_layer_name: countries
    sql:
      CASE
        WHEN ${account_id} = '570410440065284' THEN 'US'
        WHEN ${account_id} = '2232831796762341' THEN 'UK'
        WHEN ${account_id} = '1534748596609557' THEN 'KR'
        WHEN ${account_id} = '2021253954835497' THEN 'JP'
        WHEN ${account_id} = '411189149610065' THEN 'FR'
        WHEN ${account_id} = '643885896533424' THEN 'IT'
        WHEN ${account_id} = '2204243896360901' THEN 'CA'
        WHEN ${account_id} = '1024898677862308' THEN 'MX'
        WHEN ${account_id} = '2511618668901075' THEN 'IE'
        WHEN ${account_id} = '300258040696055' THEN 'RU'
        WHEN ${account_id} = '449610842533258' THEN 'PL'
        WHEN ${account_id} = '462124020998194' THEN 'NL'
        WHEN ${account_id} = '818227891881922' THEN 'DE'
        WHEN ${account_id} = '942562996405683' THEN 'FI'
        WHEN ${account_id} = '300061087393817' THEN 'ID'
        WHEN ${account_id} = '810558343031217' THEN 'SA'
        WHEN ${account_id} = '308457313210893' THEN 'BY'
        WHEN ${account_id} = '354599371917208' THEN 'AW'
        WHEN ${account_id} = '373802063261541' THEN 'TH'
        WHEN ${account_id} = '454566695090071' THEN 'PT'
        WHEN ${account_id} = '487194071879604' THEN 'TN'
        WHEN ${account_id} = '513683026052424' THEN 'DO'
        WHEN ${account_id} = '590140604890915' THEN 'SG'
        WHEN ${account_id} = '1438189276613721' THEN 'CL'
        WHEN ${account_id} = '2046067835522515' THEN 'PH'
        WHEN ${account_id} = '2247511825485999' THEN 'VN'
        WHEN ${account_id} = '2327210830824002' THEN 'MY'
        WHEN ${account_id} = '2812970958730063' THEN 'ZA'
        WHEN ${account_id} = '221075935339419' THEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)]
        WHEN ${account_id} = '554623779474325' THEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)]
        WHEN ${account_id} = '304931350135632' THEN SPLIT(${campaign_name},"_")[SAFE_OFFSET(6)]
        WHEN ${account_id} = '1534755806608836' THEN SPLIT(${campaign_name},"_")[SAFE_OFFSET(6)]
        ELSE '-'
      END
      ;;
  }

  dimension: funnel {
    type: string
    sql:
      CASE
        WHEN LOWER(SPLIT(${campaign_name},"_")[safe_ordinal(11)]) = LOWER('Top Funnel') THEN 'TOP'
        WHEN LOWER(SPLIT(${campaign_name},"_")[safe_ordinal(11)]) = LOWER('Mid Funnel') THEN 'MID'
        WHEN LOWER(SPLIT(${campaign_name},"_")[safe_ordinal(11)]) = LOWER('Full Funnel') THEN 'FULL'
        WHEN LOWER(SPLIT(${campaign_name},"_")[safe_ordinal(11)]) = LOWER('Low Funnel') THEN 'LOW'
        ELSE 'LOW'
      END
    ;;
  }



  dimension: customer_type {
    type: string
    sql:
      CASE
        WHEN LOWER(${adset_name}) LIKE '%new customer%' THEN 'New Customer'
        WHEN LOWER(${adset_name}) LIKE '%current customer%' THEN 'Current Customer'
        WHEN LOWER(${campaign_name}) LIKE '%new c%' THEN 'New Customer'
        WHEN LOWER(${campaign_name}) LIKE '%current c%' THEN 'Current Customer'
        WHEN LOWER(${adset_name}) LIKE '%all c%' THEN 'All Customers'
        ELSE ''
      END;;
  }

  dimension: zara_global_editorial {
    label: "Editorial"
    group_label: "Customer Zara"
    type: string
    sql:
      CASE
        WHEN LOWER(${ad_name}) LIKE LOWER('%_DBA_%') OR LOWER(${ad_name}) LIKE LOWER('%_DPA_%') THEN
          UPPER(split(${ad_name},'_')[safe_ordinal(6)])
        WHEN LOWER(${ad_name}) NOT LIKE LOWER('%_DBA_%') AND LOWER(${ad_name}) NOT LIKE LOWER('%_DPA_%') THEN
          UPPER(split(${ad_name},'_')[safe_ordinal(1)])
        ELSE
          'N/A'
      END;;
  }

  dimension: zara_global_extraField {
    label: "Campaign"
    group_label: "Customer Zara"
    type: string
    sql:
        case when SPLIT(${campaign_name},'_')[safe_ordinal(9)] = 'Website' then SPLIT(${campaign_name},'_')[safe_ordinal(6)]
        else SPLIT(${campaign_name},'_')[safe_ordinal(9)]
        end ;;
    hidden: no
  }

  dimension: zara_global_family {
    label: "Family"
    group_label: "Customer Zara"
    type: string
    sql:
      CASE
        WHEN LOWER(${adset_name}) LIKE LOWER('%_Female_%') THEN 'Woman'
        WHEN LOWER(${adset_name}) LIKE LOWER('%_Male_%') THEN 'Man'
        WHEN LOWER(${adset_name}) LIKE LOWER('%_Kids_%') THEN 'Kids'
        WHEN LOWER(SPLIT(${ad_name},'_')[safe_ordinal(5)]) = LOWER('Home') THEN 'Home'
        WHEN LOWER(SPLIT(${ad_name},'_')[safe_ordinal(5)]) = LOWER('Beauty') THEN 'Beauty'
        ELSE 'Undefined'
      END ;;
  }

  dimension: zara_global_adFormat {
    label: "Ad Format"
    type: string
    sql:
      SPLIT(${ad_name},'_')[safe_ordinal(2)];;
  }

  dimension: zara_global_editorialType {
    label: "Editorial Type"
    type: string
    sql:
      SPLIT(${ad_name},'_')[safe_ordinal(5)];;
  }

  dimension: zara_global_adset {
    label: "Adset"
    type: string
    sql:
      CONCAT(SPLIT(${adset_name},'_')[safe_ordinal(1)],'_',SPLIT(${adset_name},'_')[safe_ordinal(2)],'_',SPLIT(${adset_name},'_')[safe_ordinal(3)])
    ;;
  }

  dimension: zara_campaign_type {
    label: "Campaign Type"
    type: string
    sql:
    case when lower(${campaign_name}) LIKE '%ongoing%' THEN "ONGOING"
    ELSE UPPER(split(${campaign_name},'_')[safe_ordinal(3)]) END;;
  }

  dimension: zara_objective{
    label: "Objective"
    type: string
    hidden: no
    sql:
    case
    WHEN lower(${campaign_name}) LIKE '%reach%' THEN 'Reach'
    WHEN lower(${campaign_name}) LIKE '%brand awareness%' THEN 'Brand Awareness'
    WHEN lower(${campaign_name}) LIKE '%addtocart%' THEN 'AddToCart'
    WHEN lower(${campaign_name}) LIKE '%traffic%' THEN 'Traffic'
    WHEN lower(${campaign_name}) LIKE '%conversion%' and lower(${campaign_name}) LIKE '%app%' THEN 'App'
    WHEN lower(${campaign_name}) LIKE '%conversion%' and lower(${campaign_name}) not LIKE '%app%' THEN 'Conversion'
    WHEN lower(${campaign_name}) LIKE '%dba%' THEN 'DBA'
    WHEN lower(${campaign_name}) LIKE '%dpa%' THEN 'DPA'
    WHEN lower(${campaign_name}) LIKE '%app installs%' THEN 'App Installs'
    WHEN lower(${campaign_name}) LIKE '%followers%' THEN 'Followers'
    ELSE ''
    END
    ;;
  }

  dimension: country_by_account {
    label: "Country by account"
    type: string
    hidden: no
    sql:
      CASE
        WHEN ${account_id} = '570410440065284' THEN 'United States'
        WHEN ${account_id} = '2232831796762341' THEN 'United Kingdom'
        WHEN ${account_id} = '1534748596609557' THEN 'South Korea'
        WHEN ${account_id} = '2021253954835497' THEN 'Japan'
        WHEN ${account_id} = '411189149610065' THEN 'France'
        WHEN ${account_id} = '643885896533424' THEN 'Italy'
        WHEN ${account_id} = '2204243896360901' THEN 'Canada'
        WHEN ${account_id} = '1024898677862308' THEN 'Mexico'
        WHEN ${account_id} = '2511618668901075' THEN 'Ireland'
        WHEN ${account_id} = '300258040696055' THEN 'Russia'
        WHEN ${account_id} = '449610842533258' THEN 'Poland'
        WHEN ${account_id} = '462124020998194' THEN 'Netherlands'
        WHEN ${account_id} = '818227891881922' THEN 'Germany'
        WHEN ${account_id} = '942562996405683' THEN 'Finland'
        WHEN ${account_id} = '300061087393817' THEN 'Indonesia'
        WHEN ${account_id} = '810558343031217' THEN 'Saudi Arabia'
        WHEN ${account_id} = '308457313210893' THEN 'Belarus'
        WHEN ${account_id} = '354599371917208' THEN 'AW'
        WHEN ${account_id} = '373802063261541' THEN 'Thailand'
        WHEN ${account_id} = '454566695090071' THEN 'Portugal'
        WHEN ${account_id} = '487194071879604' THEN 'Tunisia'
        WHEN ${account_id} = '513683026052424' THEN 'Dominican Republic'
        WHEN ${account_id} = '590140604890915' THEN 'Singapore'
        WHEN ${account_id} = '1438189276613721' THEN 'Chile'
        WHEN ${account_id} = '2046067835522515' THEN 'Philadelphia'
        WHEN ${account_id} = '2247511825485999' THEN 'Vietnam'
        WHEN ${account_id} = '2327210830824002' THEN 'Malaysia'
        WHEN ${account_id} = '2812970958730063' THEN 'South Africa'
        WHEN ${account_id} = '304931350135632' THEN SPLIT(${campaign_name},"_")[SAFE_OFFSET(6)]
        WHEN ${account_id} = '1534755806608836' THEN SPLIT(${campaign_name},"_")[SAFE_OFFSET(6)]
        WHEN ${account_id} IN ('221075935339419', '554623779474325') THEN (CASE
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'AE' THEN 'United Arab Emirates'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'BH' THEN 'Bahrain'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'EG' THEN 'Egypt'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'JO' THEN 'Jordan'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'KW' THEN 'Kuwait'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'OM' THEN 'Oman'
        WHEN SPLIT(${adset_name},"_")[SAFE_OFFSET(3)] = 'QA' THEN 'Qatar'
        ELSE NULL
        END)
        ELSE NULL
       END;;
  }










}
