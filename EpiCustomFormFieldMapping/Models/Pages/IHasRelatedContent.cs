using EPiServer.Core;

namespace EpiCustomFormFieldMapping.Models.Pages
{
    public interface IHasRelatedContent
    {
        ContentArea RelatedContentArea { get; }
    }
}
