*** Variables ***
# Comparison page
${HIDE_COMMON_FEATURES_LABELS}      xpath=//label[normalize-space(.)='Hide Common Features']
${COMPARISON_DATA_ROWS}             css=tr[data-common-row]
${DIFFERENT_DATA_ROWS}              css=tr[data-common-row="false"]
${COMMON_DATA_ROWS}                 css=tr[data-common-row="true"]

# Fuel calculator page
${PETROL_TAB}                       xpath=//li[@title='Petrol' and normalize-space(.)='Petrol']
${ELECTRIC_TAB}                     xpath=//li[@title='Electric' and normalize-space(.)='Electric']
${PETROL_DAILY_DISTANCE_INPUT}      id=kmsvalue
${PETROL_MILEAGE_INPUT}             id=mileagevalue
${PETROL_PRICE_INPUT}               id=petrolpricevalue
${PETROL_MONTHLY_COST}              xpath=//div[contains(@class,'averageCost') and contains(.,'Monthly Fuel cost for Petrol')]
${EV_DAILY_DISTANCE_INPUT}          id=kmvalue
${EV_BATTERY_CAPACITY_INPUT}        id=capacityvalue
${EV_RANGE_INPUT}                   id=rangevalue
${EV_TARIFF_INPUT}                  id=unitvalue
${EV_MONTHLY_COST}                  xpath=//div[contains(@class,'averageCost') and contains(.,'Monthly running cost for EV')]
