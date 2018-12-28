using EpiCustomFormFieldMapping.Models.Blocks;
using EPiServer.Forms.Core.Models;
using EPiServer.Forms.Core.Validation;


namespace EpiCustomFormFieldMapping.Models.Blocks
{
    public class ConsentValidator : ElementValidatorBase
    {
        public override bool AvailableInEditView
        {
            get { return false; }
        }

        public override bool? Validate(IElementValidatable targetElement)
        {
            var consentBlock = targetElement as ConsentElementBlock;
            if (consentBlock != null && consentBlock.AttributesString.ToLower().Contains("required"))
            {
                var submittedValue = targetElement.GetSubmittedValue() as string;

                if (string.IsNullOrEmpty(submittedValue))
                {
                    return false;
                }

                return true;
            }

            return true;
        }

        public override IValidationModel BuildValidationModel(IElementValidatable targetElement)
        {
            var model = base.BuildValidationModel(targetElement);
            var consentBlock = targetElement as ConsentElementBlock;
            if (model != null)
            {
                model.Message = !string.IsNullOrEmpty(consentBlock?.ConsentRequired)
                    ? consentBlock.ConsentRequired
                    : "You have to give us consent prior to submit this form.";

            }

            return model;
        }
    }
}